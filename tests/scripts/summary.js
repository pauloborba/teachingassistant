const fs = require('fs');
const path = require('path');

const reportPath = path.join(__dirname, '..', 'reports', 'cucumber.json');

if (!fs.existsSync(reportPath)) {
  console.error('Relatório JSON não encontrado:', reportPath);
  console.error('Execute: npm run teste:json (a partir da pasta tests) e depois npm run teste:compact');
  process.exit(2);
}

let raw = fs.readFileSync(reportPath, 'utf8');
let data;
try {
  data = JSON.parse(raw);
} catch (e) {
  console.error('Erro ao parsear o JSON do relatório:', e.message);
  process.exit(2);
}

// Aggregate totals across all features
let totalScenarios = 0;
const scenarioCounts = { passed: 0, failed: 0, ambiguous: 0, undefined: 0, skipped: 0 };

let totalSteps = 0;
const stepCounts = { passed: 0, failed: 0, ambiguous: 0, undefined: 0, skipped: 0 };

function classifyScenario(stepStatuses) {
  if (stepStatuses.includes('failed')) return 'failed';
  if (stepStatuses.includes('ambiguous')) return 'ambiguous';
  if (stepStatuses.includes('undefined')) return 'undefined';
  if (stepStatuses.length > 0 && stepStatuses.every(s => s === 'skipped')) return 'skipped';
  return 'passed';
}

(data || []).forEach(feature => {
  const elems = feature.elements || [];
  elems.forEach(el => {
    if (el.type && el.type === 'background') return; // skip backgrounds
    // treat anything with steps as a scenario (includes scenario outlines expanded)
    const steps = el.steps || [];
    const stepStatuses = steps.map(s => (s.result && s.result.status) || 'skipped');

    // count steps
    stepStatuses.forEach(st => {
      totalSteps += 1;
      if (stepCounts[st] !== undefined) stepCounts[st] += 1;
      else stepCounts[st] = (stepCounts[st] || 0) + 1;
    });

    // count scenario
    const scenStatus = classifyScenario(stepStatuses);
    totalScenarios += 1;
    if (scenarioCounts[scenStatus] !== undefined) scenarioCounts[scenStatus] += 1;
    else scenarioCounts[scenStatus] = (scenarioCounts[scenStatus] || 0) + 1;
  });
});

function partsForScenarioCounts() {
  const parts = [];
  if (scenarioCounts.ambiguous) parts.push(`${scenarioCounts.ambiguous} ambiguous`);
  if (scenarioCounts.undefined) parts.push(`${scenarioCounts.undefined} undefined`);
  if (scenarioCounts.failed) parts.push(`${scenarioCounts.failed} failed`);
  if (scenarioCounts.skipped) parts.push(`${scenarioCounts.skipped} skipped`);
  if (scenarioCounts.passed) parts.push(`${scenarioCounts.passed} passed`);
  return parts.join(', ');
}

function partsForStepCounts() {
  const parts = [];
  if (stepCounts.ambiguous) parts.push(`${stepCounts.ambiguous} ambiguous`);
  if (stepCounts.undefined) parts.push(`${stepCounts.undefined} undefined`);
  if (stepCounts.failed) parts.push(`${stepCounts.failed} failed`);
  if (stepCounts.skipped) parts.push(`${stepCounts.skipped} skipped`);
  if (stepCounts.passed) parts.push(`${stepCounts.passed} passed`);
  return parts.join(', ');
}

// Print only the two summary lines requested
const line1 = `${totalScenarios} scenarios (${partsForScenarioCounts()})`;
const line2 = `${totalSteps} steps (${partsForStepCounts()})`;

console.log(line1);
console.log(line2);

// Also write concise resumo to tests/RESUMO_TESTES.txt
try {
  const outPath = path.join(__dirname, '..', 'RESUMO_TESTES.txt');
  const content = `${line1}\n${line2}\n`;
  fs.writeFileSync(outPath, content, 'utf8');
} catch (e) {
  console.error('Não foi possível escrever o resumo em RESUMO_TESTES.txt:', e.message);
}
