import { Component } from '@angular/core';
import { NgModule } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
   aluno: Aluno = {nome: "", cpf: "", email: "", loginGit: ""};
}

export class Aluno {
  nome: string;
  cpf: string;
  email: string;
  loginGit: string;
}
