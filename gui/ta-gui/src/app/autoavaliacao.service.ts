import { Injectable }    from '@angular/core';
import { Http, Headers } from '@angular/http';
import 'rxjs/add/operator/toPromise';

import { AutoAvaliacao } from './autoavaliacao';

@Injectable()
export class AutoAvaliacaoService{

	private headers = new Headers({'Content-Type': 'application/json'});
  	private taURL = 'http://localhost:3000';
  	
  	constructor(private http: Http) { }

  	criar(autoavaliacao: Autoavaliacao): Promise<Autoavaliacao> {
    return this.http.post(this.taURL + "/aluno",JSON.stringify(aluno), {headers: this.headers})
           .toPromise()
           .then(res => {
              if (res.json().success) {return aluno;} else {return null;}
           })
           .catch(this.tratarErro);
  }
} 