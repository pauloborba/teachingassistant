import { Aluno } from '../common/aluno';

export class CadastroDeAlunos {
   alunos: Aluno[] = [];

    cadastrar(aluno: Aluno): Aluno {
     var result = null;
     if (this.cpfNaoCadastrado(aluno.cpf) && this.githubNãoCadastrado(aluno.loginGithub)) {
       result = new Aluno();
       result.copyFrom(aluno);
       this.alunos.push(result);
     }
     return result;
   }

    cpfNaoCadastrado(cpf: string): boolean {
      return !this.alunos.find(a => a.cpf == cpf);
   }
    githubNãoCadastrado(github: string): boolean{
      return !this.alunos.find(x => x.loginGithub == github);
    }

    atualizar(aluno: Aluno): Aluno {
     var result: Aluno = this.alunos.find(a => a.cpf == aluno.cpf);
     if (result) result.copyFrom(aluno);
     return result;
   }

    remover(cpf: string): boolean{
      for(let x = 0; x < this.alunos.length; x++){
        if(this.alunos[x].cpf == cpf){
          console.log(x);
          this.alunos.splice(x, 1);
          return true;
        }
      }
      return false;
    }

    getAlunos(): Aluno[] {
     return this.alunos;
   }
}