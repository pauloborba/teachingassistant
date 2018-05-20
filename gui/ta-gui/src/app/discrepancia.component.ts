import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'discrepancia',
  templateUrl: './discrepancia.component.html',
  styleUrls: ['./discrepancia.component.css']
})
export class DiscrepanciaComponent implements OnInit {
   constructor(private alunoService: AlunoService) {}

   alunos: Aluno[];

   atualizarAluno(aluno: Aluno): void {
      this.alunoService.atualizar(aluno)
         .catch(erro => alert(erro));
   }

   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));
   }

}
