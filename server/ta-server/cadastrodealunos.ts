import { Aluno } from '../../gui/ta-gui/src/app/aluno';

export class CadastroDeAlunos {
  alunos: Aluno[] = [];

  criar(aluno: Aluno): Aluno {
    var result = null;
    if (this.cpfEgitNaoCadastrado(aluno.cpf,aluno.git)) {
      result = new Aluno();
      result.copyFrom(aluno);
      this.alunos.push(result);
    }
    return result;
  }
  remover(aluno: Aluno): Aluno{
    var aux = this.alunos.findIndex(tr => tr.cpf === aluno.cpf);
    console.log(aux);
    var result = this.alunos.splice(aux,1);
    return result[0];
  }
  cpfEgitNaoCadastrado(cpf: string,git:string): boolean {
     return !this.alunos.find(a => a.cpf == cpf)&&!this.alunos.find(a => a.git == git);
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
