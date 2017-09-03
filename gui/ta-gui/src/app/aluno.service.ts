<<<<<<< HEAD
import { Injectable }    from '@angular/core';
import { Http, Headers } from '@angular/http';


import { Aluno } from './aluno';

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
=======
import { Aluno } from './aluno';

export class AlunoService {
  alunos: Aluno[] = [];
  gravar(aluno: Aluno): Aluno {
     this.alunos.push(aluno);
>>>>>>> 20bb097... botao e funcionalidade do formulario para cadastro de alunos
  }
}
