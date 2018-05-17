import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { AutoAvaliacao } from './autoavaliacao';
import { AutoAvaliacaoService } from './autoavaliacao.service';

@Component({
  selector: 'autoavaliacao',
  templateUrl: './autoavaliacao.component.html',
  styleUrls: ['./autoavaliacao.component.css']
})
export class AutoAvaliacaoComponent implements OnInit {
   constructor(private alunoService: AlunoService) {}

   aluno: Aluno = new Aluno();
   alunos: Aluno[];
   cpfduplicado: boolean = false;

   criarAluno(a: Aluno): void {
     this.alunoService.criar(a)
        .then(ab => {
           if (ab) {
              this.alunos.push(ab);
              this.aluno = new Aluno();
           } else {
              this.cpfduplicado = true;
           }
        })
        .catch(erro => alert(erro));
   }

   onMove(): void {
      this.cpfduplicado = false;
   }

   ngOnInit(): void {
     this.alunoService.getAlunos()
         .then(as => this.alunos = as)
         .catch(erro => alert(erro));
   }

}
