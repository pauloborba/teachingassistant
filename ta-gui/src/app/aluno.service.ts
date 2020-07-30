import {Injectable} from '@angular/core';

import {Aluno} from './aluno';

@Injectable()
export class AlunoService{
  alunos: Aluno[] = [];

  gravar(aluno: Aluno): Aluno{
    if(this.cpfNaoCadastrado(aluno.cpf)){
      this.alunos.push(aluno);
      return aluno;
    }

    return null;
  }

  cpfNaoCadastrado(cpf: string): boolean{
    return !this.alunos.find(aluno => cpf === aluno.cpf);
  }
}
