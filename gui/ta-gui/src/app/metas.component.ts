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
   porcentagem=0;

   atualizarAluno(aluno: Aluno): void {
      this.alunoService.atualizar(aluno)
         .catch(erro => alert(erro));
      this.discrepantes=[];
      for(var i in this.alunos){
      if(this.alunos[i].autoavaliacao){
        if(this.discrepante(this.alunos[i])){
          this.discrepantes.push(this.alunos[i]);
        }
      }
      }
      this.porcentagem=(this.discrepantes.length/this.alunos.length)*100;
   }

   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => {this.alunos = alunos;
         for(var i in this.alunos){
            if(this.discrepante(this.alunos[i])){
             this.discrepantes.push(this.alunos[i]);
            }
          }
          this.porcentagem=(this.discrepantes.length/this.alunos.length)*100;
      })
         .catch(erro => alert(erro));
      
   }


   discrepante(aluno: Aluno){
   if(!aluno.autoavaliacao){
      return false;
    }
    else{
      return (aluno.autoavaliacao['requisitos'].length<aluno.metas['requisitos'].length||aluno.autoavaliacao['gerDeConfiguracao'].length<aluno.metas['gerDeConfiguracao'].length);
    }
  }

}
