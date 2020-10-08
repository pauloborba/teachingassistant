import { Component } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
   [x: string]: any;
   aluno: Aluno = {nome: "", cpf: "", email: "", github: ""};
   alunoService = new AlunoService();
   alunos: Aluno[] = [];

   gravar(a: Aluno): void {
     this.alunoService.gravar(a);

     this.alunos.push(a);
     this.aluno = {nome: "", cpf: "", email: "", github: ""};

  }
}
