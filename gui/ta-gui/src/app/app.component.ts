import { Component } from '@angular/core';
import { ApiService } from './api.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  titulo = 'Painel de Monitores';
  loginForm = {
    tipo: 'professor',
    identificador: '',
    senha: ''
  };
  erroLogin = '';
  usuarioAutenticado: { tipo: string; usuario: any } | null = null;

  constructor(private api: ApiService) {}

  realizarLogin(): void {
    this.erroLogin = '';
    this.api
      .login(this.loginForm.tipo, this.loginForm.identificador, this.loginForm.senha)
      .then(resposta => {
        this.usuarioAutenticado = resposta;
      })
      .catch(erro => (this.erroLogin = erro));
  }

  sair(): void {
    this.usuarioAutenticado = null;
    this.loginForm.identificador = '';
    this.loginForm.senha = '';
  }
}
