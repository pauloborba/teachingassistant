import { getAlunosByTurma, assertProfessorOwnership, registrarLog, updateMonitorAlocacoes } from '../helpers';
import { store, AllocationSnapshot } from '../../data/store';

export function manualAllocation(turmaId: string, professorId: string, atribuicoes: AllocationSnapshot[]) {
  assertProfessorOwnership(turmaId, professorId);
  aplicarAtribuicoes(turmaId, atribuicoes, 'Alocação manual concluída.');
  registrarLog('Alocação manual concluída.', professorId, turmaId);
  return resumo(turmaId);
}

export function aplicarAtribuicoes(turmaId: string, atribuicoes: AllocationSnapshot[], mensagemErro?: string) {
  const alunos = getAlunosByTurma(turmaId);
  const todosAlunosIds = new Set(alunos.map(a => a.id));
  const atribuidos = new Set<string>();
  atribuicoes.forEach(snapshot => {
    snapshot.alunoIds.forEach(alunoId => {
      if (!todosAlunosIds.has(alunoId)) {
        throw new Error('Aluno inválido informado.');
      }
      if (atribuidos.has(alunoId)) {
        throw new Error('Duplicidade detectada durante a alocação.');
      }
      atribuidos.add(alunoId);
    });
  });
  if (atribuidos.size !== alunos.length) {
    throw new Error(mensagemErro || 'Todos os alunos devem ser alocados.');
  }
  alunos.forEach(aluno => (aluno.monitorId = null));
  atribuicoes.forEach(snapshot => {
    snapshot.alunoIds.forEach(alunoId => {
      const aluno = store.alunos.find(a => a.id === alunoId);
      if (aluno) {
        aluno.monitorId = snapshot.monitorId;
      }
    });
  });
  updateMonitorAlocacoes(turmaId);
}

function resumo(turmaId: string) {
  return store.monitores
    .filter(m => m.turmaId === turmaId)
    .map(m => ({
      monitorId: m.id,
      monitorNome: m.nome,
      totalAlunos: m.alunosAlocados.length
    }));
}
