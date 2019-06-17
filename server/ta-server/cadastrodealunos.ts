import { Aluno } from '../../gui/ta-gui/src/app/aluno';

export class CadastroDeAlunos {
  alunos: Aluno[] = [];

  criar(aluno: Aluno): Aluno {
    var result = null;
    if (this.cpfNaoCadastrado(aluno.cpf) && this.gitHubNaoCadastrado(aluno.logingithub)) {
      result = new Aluno();
      result.copyFrom(aluno);
      this.alunos.push(result);
    }
    return result;
  }

  cpfNaoCadastrado(cpf: string): boolean {
     return !this.alunos.find(a => a.cpf == cpf);
  }
  gitHubNaoCadastrado(logingithub: string): boolean{

    return !this.alunos.find(a => a.logingithub ==logingithub);
  }

  atualizar(aluno: Aluno): Aluno {
    var result: Aluno = this.alunos.find(a => a.cpf == aluno.cpf);
    if (result) result.copyFrom(aluno);
    return result;
  }
  remover(cpf: String): Aluno {
    var result: Aluno = this.alunos.find(a => a.cpf == cpf);
   if(result){
   this.alunos = this.alunos.filter(a => a.cpf!=cpf);
   }
    return result;
  }
  
 

  getAlunos(): Aluno[] {
    return this.alunos;
  }
}