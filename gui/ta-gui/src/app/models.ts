export interface Professor {
  id: string;
  nome: string;
  email: string;
  turmas: string[];
}

export interface Turma {
  id: string;
  nome: string;
  professorId: string;
  totalAlunos?: number;
  totalMonitores?: number;
}

export interface Monitor {
  id: string;
  nome: string;
  matricula: string;
  turmaId: string;
  alunosAlocados: string[];
}

export interface Aluno {
  id: string;
  nome: string;
  matricula: string;
  turmaId: string;
  monitorId: string | null;
}

export interface NotificacaoResumo {
  tipo: 'aluno' | 'monitor';
  mensagem: string;
  destinatarioId: string;
}

export interface Revalidacao {
  valido: boolean;
  erros: string[];
  resumo: {
    totalAlunos: number;
    totalMonitores: number;
    monitoresSemAlunos: string[];
    alunosSemMonitor: string[];
  };
}

export interface LogEntry {
  id: string;
  descricao: string;
  responsavelId: string;
  timestamp: string;
  turmaId?: string;
}
