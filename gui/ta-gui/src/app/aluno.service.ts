import { Injectable }    from '@angular/core';
import { Http, Headers } from '@angular/http';
import 'rxjs/add/operator/toPromise';

import { Aluno } from './aluno';
import { Avaliacao } from './avaliacao';

@Injectable()
export class AlunoService {

  private headers = new Headers({'Content-Type': 'application/json'});
  private taURL = 'http://localhost:3000';

  constructor(private http: Http) { }

  criar(aluno: Aluno): Promise<Aluno> {
    return this.http.post(this.taURL + "/aluno",JSON.stringify(aluno), {headers: this.headers})
           .toPromise()
           .then(res => {
              if (res.json().success) {return aluno;} else {return null;}
           })
           .catch(this.tratarErro);
  }

  atualizar(aluno: Aluno): Promise<Aluno> {
    return this.http.put(this.taURL + "/aluno",JSON.stringify(aluno), {headers: this.headers})
         .toPromise()
         .then(res => {
            if (res.json().success) {return aluno;} else {return null;}
         })
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

  criarAvaliacao(avaliacao: Avaliacao): Promise<Avaliacao> {
    return this.http.post(this.taURL + "/avaliacao",JSON.stringify(avaliacao), {headers: this.headers})
           .toPromise()
           .then(res => {
              if (res.json().success) {return avaliacao;} else {return null;}
           })
           .catch(this.tratarErro);
  }

  atualizarAvaliacao(avaliacao: Avaliacao): Promise<Avaliacao> {
    return this.http.put(this.taURL + "/avaliacao",JSON.stringify(avaliacao), {headers: this.headers})
         .toPromise()
         .then(res => {
            if (res.json().success) {return avaliacao;} else {return null;}
         })
         .catch(this.tratarErro);
  }

  getAvaliacoes(): Promise<Avaliacao[]>{
    return this.http.get(this.taURL + "/avaliacoes")
              .toPromise()
              .then(res => res.json() as Avaliacao[])
              .catch(this.tratarErro);
  }
}
