export interface Aluno {
  id: string;
  nome: string;
  matricula: string;
  turmaId: string;
  monitorId: string | null;
  email?: string;
  senha?: string;
}
