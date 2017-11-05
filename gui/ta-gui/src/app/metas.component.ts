import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';
import { Injectable }    from '@angular/core';
import { Http, Headers } from '@angular/http';
import 'rxjs/add/operator/toPromise';



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
   campovazio: boolean = false;
   
   atualizarAluno(aluno: Aluno): void {
      
      if (this.alunoService.atualizar(aluno)){
        this.alunoService.atualizar(aluno)
      } else{
        this.campovazio = true;
      }
   }

   ngOnInit(): void {
    /* this.alunos = this.alunoService.getAlunos(); */
  }
  
  onMove(): void {
      this.campovazio = false;
   }

}

