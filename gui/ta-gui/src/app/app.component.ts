import { Component } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { Avaliacao } from './avaliacao';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
   constructor(private alunoService: AlunoService) {}

   aluno: Aluno = new Aluno();
   avaliacao: Avaliacao = new Avaliacao();
   alunos: Aluno[] = [];
   avaliacoes: Avaliacao[] = [];
   cpfduplicado: boolean = false;

   criarAluno(a: Aluno): void {
     if (this.alunoService.criar(a)) {
       this.alunos.push(a);
       this.aluno = new Aluno();
     } else {
       this.cpfduplicado = true;
     }
   }

    criarAval(b: Avaliacao): void {
     if (this.alunoService.criarAvaliacao(b)) {
       this.avaliacoes.push(b);
       this.avaliacao = new Avaliacao();
     }
   }

   onMove(): void {
      this.cpfduplicado = false;
   }

}
