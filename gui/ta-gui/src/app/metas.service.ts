import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions } from '@angular/http';
import 'rxjs/add/operator/toPromise';

import { Meta } from './meta';

@Injectable()
export class MetaService {

    private headers = new Headers({ 'Content-Type': 'application/json' });
    private taURL = 'http://localhost:3000';

    constructor(private http: Http) { }

    criar(meta: Meta): Promise<Meta> {
        return this.http.post(this.taURL + "/metas", JSON.stringify(meta), { headers: this.headers })
            .toPromise()
            .then(res => {
                if (res.json().success) { return meta; } else { return null; }
            })
            .catch(this.tratarErro);
    }

    atualizar(meta: Meta, nome: string): Promise<Meta> {
        var payload = {"meta": meta, "nome": nome}
        return this.http.put(this.taURL + "/metas", JSON.stringify(payload), { headers: this.headers })
            .toPromise()
            .then(res => {
                if (res.json().success) { return meta; } else { return null; }
            })
            .catch(this.tratarErro);
    }

    remover(meta: Meta): Promise<Meta> {
        return this.http.delete(this.taURL + "/metas", new RequestOptions({
            headers : this.headers,
            body: JSON.stringify(meta)
        }))
            .toPromise()
            .then(res => {
                if (res.json().success) { return meta; } else { return null; }
            })
            .catch(this.tratarErro);
    }

    getMetas(): Promise<Meta[]> {
        return this.http.get(this.taURL + "/metas")
            .toPromise()
            .then(res => res.json() as Meta[])
            .catch(this.tratarErro);
    }

    private tratarErro(erro: any): Promise<any> {
        console.error('Acesso mal sucedido ao serviço de metas', erro);
        return Promise.reject(erro.message || erro);
    }
}
