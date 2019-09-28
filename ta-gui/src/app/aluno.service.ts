import {Injectable} from '@angular/core';

import { Aluno } from '../../../common/aluno';

@Injectable()
export class AlunoService{
  alunos: Aluno[] = [];

  criar(aluno: Aluno): Aluno{
    aluno = aluno.clone();
    if(this.cpfNaoCadastrado(aluno.cpf)){
      this.alunos.push(aluno);
      return aluno;
    }

    return null;
  }

  cpfNaoCadastrado(cpf: string): boolean{
    return !this.alunos.find(aluno => cpf === aluno.cpf);
  }

  atualizarMetas(aluno: Aluno): void{
    aluno = aluno.clone();
    this.alunos.forEach(a => {
      if(a.cpf === aluno.cpf){
        a.metas = aluno.metas;
      }
    });
  }

  getAlunos(): Aluno[]{
    var result: Aluno[] = [];
    for(let a of this.alunos){
      result.push(a.clone());
    }

    return result;
  }
}
