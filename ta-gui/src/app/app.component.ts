import { Component } from '@angular/core';
import { NgModule } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
   [x: string]: any;
   aluno: Aluno = {nome: "", cpf: "", email: "", github: ""};
}

export class Aluno {
  nome: string;
  cpf: string;
  email: string;
  github: string;
}
