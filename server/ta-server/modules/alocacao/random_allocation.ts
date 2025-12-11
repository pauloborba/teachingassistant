import { getAlunosByTurma, getMonitoresByTurma, assertProfessorOwnership, registrarLog, updateMonitorAlocacoes } from '../helpers';
import { store } from '../../data/store';

export function randomAllocation(turmaId: string, professorId: string) {
  assertProfessorOwnership(turmaId, professorId);
  const alunos = getAlunosByTurma(turmaId).slice().sort((a, b) => a.nome.localeCompare(b.nome));
  const monitores = getMonitoresByTurma(turmaId);
  if (monitores.length === 0) {
    throw new Error('Cadastre monitores antes de alocar.');
  }
  if (alunos.length === 0) {
    throw new Error('Não há alunos para alocar.');
  }
  const ordemMonitores = shuffle(monitores.map(m => m.id));
  alunos.forEach((aluno, index) => {
    const monitorId = ordemMonitores[index % ordemMonitores.length];
    aluno.monitorId = monitorId;
  });
  updateMonitorAlocacoes(turmaId);
  registrarLog('Alocação aleatória concluída.', professorId, turmaId);
  return resumoAlocacao(turmaId);
}

function shuffle<T>(items: T[]): T[] {
  for (let i = items.length - 1; i > 0; i -= 1) {
    const j = Math.floor(Math.random() * (i + 1));
    [items[i], items[j]] = [items[j], items[i]];
  }
  return items;
}

function resumoAlocacao(turmaId: string) {
  const monitores = getMonitoresByTurma(turmaId);
  return monitores.map(m => ({
    monitorId: m.id,
    monitorNome: m.nome,
    alunos: m.alunosAlocados.map(alunoId => {
      const aluno = store.alunos.find(a => a.id === alunoId);
      return aluno ? aluno.nome : alunoId;
    })
  }));
}
