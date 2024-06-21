import { Aluno } from '../common/aluno';

export class CadastroDeAlunos {
   alunos: Aluno[] = [];

    cadastrar(aluno: Aluno): Aluno {
     var result = null;
     if (this.cpfNaoCadastrado(aluno.cpf) && this.gitNaoCadastrado(aluno.gitLogin)) {
       result = new Aluno();
       result.copyFrom(aluno);
       this.alunos.push(result);
     }
     return result;
   }

    cpfNaoCadastrado(cpf: string): boolean {
      return !this.alunos.find(a => a.cpf == cpf);
   }

    gitNaoCadastrado(gitLogin: string): boolean {
    return !this.alunos.find(a => a.gitLogin == gitLogin);
   }

    atualizar(aluno: Aluno): Aluno {
     var result: Aluno = this.alunos.find(a => a.cpf == aluno.cpf);
     if (result) result.copyFrom(aluno);
     return result;
   }

    excluir(cpf: string) {
      var i;
      var flag = true;
      for(i=0; i<this.alunos.length; i++){
        if(this.alunos[i].cpf == cpf){
          flag = false;
          break;
        }
      }
      if(flag){
        return null;
      }
      console.log(i);
      this.alunos.splice(i,1);
      return true;
    }

    getAlunos(): Aluno[] {
     return this.alunos;
   }
}