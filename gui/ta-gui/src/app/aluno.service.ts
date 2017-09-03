import { Aluno } from './aluno';

export class AlunoService {
  alunos: Aluno[] = [];
  gravar(aluno: Aluno): Aluno {
     this.alunos.push(aluno);
  }
}
