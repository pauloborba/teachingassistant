import { Aluno } from './aluno';

export class AlunoService {
  alunos: Aluno[] = [];
  gravar(aluno: Aluno): Aluno {
    var result = null;
    if (this.cpfNaoCadastrado(aluno.cpf)) {
      this.alunos.push(aluno);
      result = aluno;
    }
    return result;
  }
  cpfNaoCadastrado(cpf: string): boolean {
     return !this.alunos.find(a => a.cpf == cpf);
  }
}
