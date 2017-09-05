import { Injectable } from '@angular/core';

import { Aluno } from './aluno';

@Injectable()
export class AlunoService {
  alunos: Aluno[] = [];

  criar(aluno: Aluno): Aluno {
    aluno = aluno.clone();
    var result = null;
    if (this.cpfNaoCadastrado(aluno.cpf)) {
      this.alunos.push(aluno);
      result = aluno;
    }
    return result;
  }

  cpfNaoCadastrado(cpf: string): boolean {
     return !this.alunos.find(a => a.cpf == cpf);
  }

  atualizar(aluno:Aluno): void {
    aluno = aluno.clone();
    for (let a of this.alunos) {
        if (a.cpf == aluno.cpf) {
           a.metas = aluno.metas;
        }
    }
  }
}
