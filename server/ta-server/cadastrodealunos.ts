import { Aluno } from '../../gui/ta-gui/src/app/aluno';

export class CadastroDeAlunos {
  alunos: Aluno[] = [];

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
    if(this.completouAutoAvaliacao(aluno)) {
      var result: Aluno = this.alunos.find(a => a.cpf == aluno.cpf);
      if (result) result.copyFrom(aluno);
      console.log("oi");
      return result;
     
    } else 
      return null;
  }

  completouAutoAvaliacao(aluno: Aluno) {
    return !this.nullOrEmpty(aluno.metasAutoAvaliacao['requisitos']) && !this.nullOrEmpty(aluno.metasAutoAvaliacao['gerDeConfiguracao']);
  }

  nullOrEmpty(meta: string): boolean {
    return meta == null || meta == "";
  }

  getAlunos(): Aluno[] {
    return this.alunos;
  }
}
