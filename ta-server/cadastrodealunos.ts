import { Aluno } from '../common/aluno';
import AlunoDuplicado from '../common/alunoDuplicado';

export class CadastroDeAlunos {
  alunos: Aluno[] = [];

  cadastrar(aluno: Aluno): Aluno | AlunoDuplicado {
    var alunoDuplicado: AlunoDuplicado = {cpf: false, github: false};
    if (!this.cpfNaoCadastrado(aluno.cpf)){
      alunoDuplicado.cpf = true;
    }
    if(!this.githubNaoCadastrado(aluno.github)){
      alunoDuplicado.github = true;
    }

    if(alunoDuplicado.cpf || alunoDuplicado.github){
      return alunoDuplicado;
    }else{
      let newAluno = new Aluno();
      newAluno.copyFrom(aluno);
      this.alunos.push(newAluno);
      return newAluno;
    }
  }

  cpfNaoCadastrado(cpf: string): boolean {
    return !this.alunos.find(a => a.cpf == cpf);
  }

  githubNaoCadastrado(github: string): boolean {
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