import { Aluno } from '../../gui/ta-gui/src/app/aluno';

export class CadastroDeAlunos {
  alunos: Aluno[] = [
    (new Aluno()).define("Mario", "1", "m@"),
    (new Aluno()).define("Pedro", "2", "p@"),
    (new Aluno()).define("Correa", "3", "c@"),
    (new Aluno()).define("Borba", "4", "b@"),
    (new Aluno()).define("Claudio", "5", "c@"),
    (new Aluno()).define("Nando", "6", "n@"),
    (new Aluno()).define("Gui", "7", "g@"),
    (new Aluno()).define("Marcela", "8", "v@"),
  ];

  criar(aluno: Aluno): Aluno {
    var result = null;
    if (this.cpfNaoCadastrado(aluno.cpf)) {
      result = new Aluno();
      result.copyFrom(aluno);
      this.alunos.push(result);
    }
    return result;
  }

  cpfNaoCadastrado(cpf: string): boolean {
     return !this.alunos.find(a => a.cpf == cpf);
  }

  atualizar(aluno: Aluno): Aluno {
    var result: Aluno = this.alunos.find(a => a.cpf == aluno.cpf);
    if (result) result.copyFrom(aluno);
    return result;
  }
  
  deleteAluno(cpf:string){
    var a:number = this.alunos.findIndex(x => x.cpf == cpf);//this.alunos.findIndex(x => x.cpf==cpf);
    this.alunos.splice(a,1);
  }

  getAlunos(): Aluno[] {
    return this.alunos;
  }
}
