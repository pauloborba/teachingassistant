import { Aluno } from '../../gui/ta-gui/src/app/aluno';

export class CadastroDeAlunos {
  alunos: Aluno[] = [];

  criar(aluno: Aluno): Aluno {
    var result = null;
    if (!this.githubNaoCadastrado(aluno.github)) throw new Error('github já existe')
    if (!this.cpfNaoCadastrado(aluno.cpf)) throw new Error('github já existe')
    result = new Aluno();
    result.copyFrom(aluno);
    this.alunos.push(result);
    return result;
  }
  remover(aluno:Aluno): void {
    const index = this.alunos.findIndex(x => x.cpf === aluno.cpf)
    if (index !== -1) {
      this.alunos.splice(index, 1)
    }
  }

  cpfNaoCadastrado(cpf: string): boolean {
     return !this.alunos.find(a => a.cpf == cpf);
  }
  githubNaoCadastrado(github:string): boolean {
    return !this.alunos.find(a => a.github === github);
  }

  atualizar(aluno: Aluno): Aluno {
    var result: Aluno = this.alunos.find(a => a.cpf == aluno.cpf);
    if (result) result.copyFrom(aluno);
    return result;
  }

  getAlunos(): Aluno[] {
    return this.alunos;
  }
}
