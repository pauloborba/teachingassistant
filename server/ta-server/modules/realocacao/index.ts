import { getAlunosByTurma, getMonitoresByTurma, assertProfessorOwnership, registrarLog, updateMonitorAlocacoes } from '../helpers';

export function realocarAutomaticamente(turmaId: string, professorId: string, limiteMaximo: number) {
  assertProfessorOwnership(turmaId, professorId);
  const alunos = getAlunosByTurma(turmaId).slice().sort((a, b) => a.nome.localeCompare(b.nome));
  const monitores = getMonitoresByTurma(turmaId).slice().sort((a, b) => a.nome.localeCompare(b.nome));
  if (monitores.length === 0) {
    throw new Error('Cadastre monitores antes de realocar.');
  }
  if (alunos.length < monitores.length) {
    throw new Error('Há monitores sem alunos disponíveis.');
  }
  if (limiteMaximo && limiteMaximo < Math.ceil(alunos.length / monitores.length)) {
    throw new Error('Limite de alunos atingido.');
  }
  const atribuicoes = new Map<string, string[]>();
  monitores.forEach(m => atribuicoes.set(m.id, []));
  // garantir ao menos um aluno por monitor
  monitores.forEach((monitor, index) => {
    const aluno = alunos[index];
    if (aluno) {
      atribuicoes.get(monitor.id)!.push(aluno.id);
    }
  });
  let cursor = monitores.length;
  while (cursor < alunos.length) {
    const candidatos = monitores
      .map(monitor => ({ monitor, total: atribuicoes.get(monitor.id)!.length }))
      .sort((a, b) => {
        if (a.total === b.total) {
          return a.monitor.nome.localeCompare(b.monitor.nome);
        }
        return a.total - b.total;
      })
      .filter(item => !limiteMaximo || item.total < limiteMaximo);
    if (candidatos.length === 0) {
      throw new Error('Limite de alunos atingido.');
    }
    const escolhido = candidatos[0];
    atribuicoes.get(escolhido.monitor.id)!.push(alunos[cursor].id);
    cursor += 1;
  }
  // aplicar resultado
  alunos.forEach(aluno => (aluno.monitorId = null));
  atribuicoes.forEach((alunoIds, monitorId) => {
    alunoIds.forEach(alunoId => {
      const aluno = alunos.find(a => a.id === alunoId);
      if (aluno) {
        aluno.monitorId = monitorId;
      }
    });
  });
  updateMonitorAlocacoes(turmaId);
  registrarLog('Realocação automática concluída.', professorId, turmaId);
  return Array.from(atribuicoes).map(([monitorId, alunoIds]) => ({ monitorId, alunoIds }));
}
