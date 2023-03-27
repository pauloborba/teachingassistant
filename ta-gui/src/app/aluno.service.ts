import { Aluno } from './aluno';

export class AlunoService {
  alunos: Aluno[] = [];
  gravar(aluno: Aluno): void {
     this.alunos.push(aluno);
  }
}
