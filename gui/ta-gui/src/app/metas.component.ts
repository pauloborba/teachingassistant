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

   atualizarAluno(aluno: Aluno): void {
      this.calculateFinalAverage(aluno);
      this.alunoService.atualizar(aluno)
         .catch(erro => alert(erro));
   }

   calculateFinalAverage(aluno: Aluno): void {
    var media = aluno.media;
    var finalExam = aluno.finalExam;
    var finalAverage = 0;

    if(media !== "" && finalExam !== "") {
      finalAverage = (Number(media) + Number(finalExam))/2;
    } else {
      finalAverage = Number(media);
    }

    aluno.finalAverage = finalAverage;
    aluno.mediaTitle = studentFinalAverageTitle(finalAverage);
  }

  studentFinalAverageTitle(media: int): string {
     if (media >= 5)
      return "Aprovado"
    else
      return "Reprovado Final"
  }

   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));
   }

}
