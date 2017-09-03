import { Injectable }    from '@angular/core';
import { Http, Headers } from '@angular/http';


import { Aluno } from './aluno';

@Injectable()
export class AlunoService {
  alunos: Aluno[] = [];
  gravar(aluno: Aluno): Aluno {
    var result = null;
    if (!this.alunos.find(a => a.cpf == aluno.cpf)) {
      this.alunos.push(aluno);
      result = aluno;
    }
    return result;
  }
}
