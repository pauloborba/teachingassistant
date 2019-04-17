import { Injectable }    from '@angular/core';
import { Http, Headers } from '@angular/http';
import 'rxjs/add/operator/toPromise';

import { Aluno } from './aluno';

@Injectable()
export class AlunoService {

  private headers = new Headers({'Content-Type': 'application/json'});
  private taURL = 'http://localhost:3000';

  constructor(private http: Http) { }

  criar(aluno: Aluno): Promise<Aluno> {
    return this.http.post(this.taURL + "/aluno",JSON.stringify(aluno), {headers: this.headers})
           .toPromise()
           .then(res => res.json())
           .then(res => {
             if (res.failure) throw new Error(res.failure)
             return aluno;
           })
           .catch(this.tratarErro);
  }

  atualizar(aluno: Aluno): Promise<Aluno> {
    return this.http.put(this.taURL + "/aluno",JSON.stringify(aluno), {headers: this.headers})
         .toPromise()
         .then(res => res.json())
         .then(res => {
           if (res.failure) throw new Error(res.failure)
           return aluno;
         })
         .catch(this.tratarErro);
  }
  remover(aluno: Aluno) : Promise<any> {
    return this.http.delete(this.taURL + '/aluno', {headers: this.headers, body: JSON.stringify(aluno)})
      .toPromise()
      .catch(this.tratarErro);
  }

  getAlunos(): Promise<Aluno[]> {
    return this.http.get(this.taURL + "/alunos")
             .toPromise()
             .then(res => res.json() as Aluno[])
             .catch(this.tratarErro);
  }

  private tratarErro(erro: any): Promise<any>{
    console.error('Acesso mal sucedido ao serviço de alunos',erro);
    return Promise.reject(erro.message || erro);
  }
}
