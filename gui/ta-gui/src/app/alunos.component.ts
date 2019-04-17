import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  templateUrl: './alunos.component.html',
  styleUrls: ['./alunos.component.css']
})
export class AlunosComponent implements OnInit {
   constructor(private alunoService: AlunoService) {}

   aluno: Aluno = new Aluno();
   alunos: Aluno[];
   erro: string = null;

   criarAluno(a: Aluno): void {
     this.alunoService.criar(a)
        .then(ab => {
          this.alunos.push(ab);
          this.aluno = new Aluno();
        })
        .catch(e => {
          this.erro = e
        });
   }

   onMove(): void {
      this.erro = null;
   }

   ngOnInit(): void {
     this.alunoService.getAlunos()
         .then(as => this.alunos = as)
         .catch(erro => alert(erro));
   }

}
