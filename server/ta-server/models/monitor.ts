export interface Monitor {
  id: string;
  nome: string;
  matricula: string;
  turmaId: string;
  alunosAlocados: string[];
  senha?: string;
}
