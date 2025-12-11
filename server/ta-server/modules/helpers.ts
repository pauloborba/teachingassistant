import { store } from '../data/store';
import { Aluno, Monitor, Professor, Turma, LogEntry } from '../models';

export function getProfessorById(id: string): Professor | undefined {
  return store.professors.find(p => p.id === id);
}

export function getTurmaById(id: string): Turma | undefined {
  return store.turmas.find(t => t.id === id);
}

export function getMonitoresByTurma(turmaId: string): Monitor[] {
  return store.monitores.filter(m => m.turmaId === turmaId);
}

export function getAlunosByTurma(turmaId: string): Aluno[] {
  return store.alunos.filter(a => a.turmaId === turmaId);
}

export function assertProfessorOwnership(turmaId: string, professorId: string): void {
  const turma = getTurmaById(turmaId);
  if (!turma || turma.professorId !== professorId) {
    throw new Error('Apenas o professor responsável pode executar esta ação.');
  }
}

export function updateMonitorAlocacoes(turmaId: string): void {
  const monitores = getMonitoresByTurma(turmaId);
  monitores.forEach(m => (m.alunosAlocados = []));
  const alunos = getAlunosByTurma(turmaId);
  alunos.forEach(aluno => {
    if (aluno.monitorId) {
      const monitor = monitores.find(m => m.id === aluno.monitorId);
      if (monitor) {
        monitor.alunosAlocados.push(aluno.id);
      }
    }
  });
}

export function registrarLog(descricao: string, responsavelId: string, turmaId?: string): void {
  const log: LogEntry = {
    id: `log-${store.logs.length + 1}`,
    descricao,
    responsavelId,
    turmaId,
    timestamp: new Date().toISOString()
  };
  store.logs.unshift(log);
}

export interface RevalidacaoResultado {
  valido: boolean;
  erros: string[];
  resumo: {
    totalAlunos: number;
    totalMonitores: number;
    monitoresSemAlunos: string[];
    alunosSemMonitor: string[];
  };
}

export function revalidarTurma(turmaId: string): RevalidacaoResultado {
  const alunos = getAlunosByTurma(turmaId);
  const monitores = getMonitoresByTurma(turmaId);
  const alunosSemMonitor = alunos.filter(aluno => !aluno.monitorId).map(aluno => aluno.nome);
  const monitoresSemAlunos = monitores.filter(m => m.alunosAlocados.length === 0).map(m => m.nome);
  const erros: string[] = [];
  if (alunosSemMonitor.length > 0) {
    erros.push('Existem alunos sem monitor.');
  }
  if (monitoresSemAlunos.length > 0) {
    erros.push('Existem monitores sem alunos.');
  }
  return {
    valido: erros.length === 0,
    erros,
    resumo: {
      totalAlunos: alunos.length,
      totalMonitores: monitores.length,
      monitoresSemAlunos,
      alunosSemMonitor
    }
  };
}
