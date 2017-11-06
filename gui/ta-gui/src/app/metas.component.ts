import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'metas',
  templateUrl: './metas.component.html',
  styleUrls: ['./metas.component.css']
})
export class MetasComponent implements OnInit {
   constructor(private alunoService: AlunoService) {}

   alunos: Aluno[];
   discrepantes: Aluno[] = [];

   atualizarAluno(aluno: Aluno): void {
      this.alunoService.atualizar(aluno)
         .catch(erro => alert(erro));
      for(var i in this.alunos){
        if(this.discrepante(this.alunos[i])){
          this.discrepantes.push(this.alunos[i]);
        }
      }
   }

   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));
      for(var i in this.alunos){
        if(this.discrepante(this.alunos[i])){
          this.discrepantes.push(this.alunos[i]);
        }
      }
   }


   discrepante(aluno: Aluno){
    if(aluno.autoavaliacao.size==2){
      return (aluno.autoavaliacao['requisitos'].length<aluno.metas['requisitos'].length||aluno.autoavaliacao['gerDeConfiguracao'].length<aluno.metas['gerDeConfiguracao'].length);
    }else if(aluno.autoavaliacao.size==0){
      return false;
    }
  }

}
