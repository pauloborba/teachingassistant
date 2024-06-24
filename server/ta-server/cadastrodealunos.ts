import { Aluno } from '../../common/aluno';

export class CadastroDeAlunos {
   alunos: Aluno[] = [];

    cadastrar(aluno: Aluno): String {
     var result = null;
     var cpf : boolean = false;
     var github : boolean = false;
     if (this.cpfNaoCadastrado(aluno.cpf)) {
       if(this.githubNaoCadastrado(aluno.github)) {
          result = new Aluno();
          result.copyFrom(aluno);
          this.alunos.push(result);
          return "ok";
       }
       return "github"
     }
     return "cpf";
   }

    cpfNaoCadastrado(cpf: string): boolean {
       if(cpf != ""){
         return !this.alunos.find(a => a.cpf == cpf);
       } else {
          return false
       }
   }

   githubNaoCadastrado(github: string): boolean{
      if(github != null){
         return !this.alunos.find(a => a.github == github);
      } else {
         return false
      }
   }

   remover(cpf: String): String {
      for (let index = 0; index < this.alunos.length; index++) {
         if(this.alunos[index].cpf == cpf){
            this.alunos.splice(index, 1)
            return "ok";
         }
      }
      return "falha";
      /*
      this.alunos.find(a => {
         if (a.cpf == cpf){
            this.alunos.splice(this.alunos.indexOf(a), 1)
            console.log("Primeiro delete" + cpf);
            return "ok";
         }})
      //console.log("Segundo delete" + cpf);
      return "failure";
      */
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