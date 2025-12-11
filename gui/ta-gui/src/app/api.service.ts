import { Injectable } from '@angular/core';
import { Http, Headers } from '@angular/http';
import 'rxjs/add/operator/toPromise';

import { Professor, Turma, Monitor, Aluno, Revalidacao, LogEntry, NotificacaoResumo } from './models';

@Injectable()
export class ApiService {
  private headers = new Headers({ 'Content-Type': 'application/json' });
  private baseUrl = 'http://localhost:3000';

  constructor(private http: Http) {}

  login(tipo: string, identificador: string, senha: string): Promise<{ tipo: string; usuario: any }> {
    return this.post('/auth/login', { tipo, identificador, senha });
  }

  getTurmas(professorId: string): Promise<Turma[]> {
    return this.get(`/turmas?professorId=${professorId}`);
  }

  getAlunos(turmaId: string): Promise<Aluno[]> {
    return this.get(`/turmas/${turmaId}/alunos`);
  }

  getMonitores(turmaId: string): Promise<Monitor[]> {
    return this.get(`/turmas/${turmaId}/monitores`);
  }

  cadastrarMonitor(turmaId: string, professorId: string, payload: any): Promise<Monitor> {
    return this.post(`/turmas/${turmaId}/monitores`, payload, professorId);
  }

  alocarAleatorio(turmaId: string, professorId: string): Promise<any> {
    return this.post(`/turmas/${turmaId}/alocacoes/random`, {}, professorId);
  }

  alocarManual(turmaId: string, professorId: string, atribuicoes: any[]): Promise<any> {
    return this.post(`/turmas/${turmaId}/alocacoes/manual`, { atribuicoes }, professorId);
  }

  salvarCorrecao(turmaId: string, professorId: string, atribuicoes: any[]): Promise<any> {
    return this.post(`/turmas/${turmaId}/correcao`, { atribuicoes }, professorId);
  }

  realocar(turmaId: string, professorId: string, limiteMaximo: number): Promise<any> {
    return this.post(`/turmas/${turmaId}/realocacao`, { limiteMaximo }, professorId);
  }

  enviarNotificacoes(turmaId: string, professorId: string): Promise<NotificacaoResumo[]> {
    return this.post(`/turmas/${turmaId}/notificacoes`, {}, professorId);
  }

  revalidar(turmaId: string): Promise<Revalidacao> {
    return this.get(`/turmas/${turmaId}/revalidar`);
  }

  getLogs(): Promise<LogEntry[]> {
    return this.get('/logs');
  }

  private get(path: string): Promise<any> {
    return this.http
      .get(`${this.baseUrl}${path}`)
      .toPromise()
      .then(res => (res.json().data !== undefined ? res.json().data : res.json()))
      .catch(this.handleError);
  }

  private post(path: string, payload: any, professorId?: string): Promise<any> {
    const headers = new Headers(this.headers);
    if (professorId) {
      headers.append('x-professor-id', professorId);
    }
    return this.http
      .post(`${this.baseUrl}${path}`, JSON.stringify(payload), { headers })
      .toPromise()
      .then(res => {
        if (!res.json().success) {
          throw new Error(res.json().error || 'Falha na operação.');
        }
        return res.json().data;
      })
      .catch(this.handleError);
  }

  private handleError(erro: any): Promise<any> {
    const message = erro.message || (erro.json && erro.json().error) || 'Erro ao acessar o servidor';
    return Promise.reject(message);
  }
}
