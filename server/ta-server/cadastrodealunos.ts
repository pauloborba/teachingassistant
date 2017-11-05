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
    var result: Aluno = this.alunos.find(a => a.cpf == aluno.cpf);
    if (result) result.copyFrom(aluno);
    return result;
  }

  getAlunos(): Aluno[] {
    return this.alunos;
  }

  campoNaoVazio(metas: string): boolean {
   return !this.alunos.find(a => "" == metas);
  }

  atualizar(aluno: Aluno): void {
    aluno = aluno.clone();
    var result2 = null;
    
    if (this.campoNaoVazio(aluno.metas)){
      
      for (let a of this.alunos) {
        if (a.cpf == aluno.cpf) {
           a.metas = aluno.metas;
        }
      }
      alert("Conceito registrado com sucesso!");
      result2 = aluno;
    }
    if (result2 == null) {
      alert("Campo Vazio! É necessário preencher todos os campos da auto avaliação.");
    }
    
    return result2;
  }

}
