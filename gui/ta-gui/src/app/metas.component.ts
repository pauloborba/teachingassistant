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
      this.calculateAverage(aluno);
      this.alunoService.atualizar(aluno)
         .catch(erro => alert(erro));
   }

   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));
   }

   calculateAverage(aluno: Aluno): void {
    let metas = aluno.metas;
    var media = "";
    var mediaTitle = "";
    var MAs = 0;
    var MPAs = 0;
    var MANAs = 0;

    for (let key in metas) {
      let meta = aluno.metas[key].toUpperCase();

      if (meta == "MA"){
        MAs++;
      } else if (meta == "MPA"){
        MPAs++;
      } else if (meta == "MANA"){
        MANAs++;
      } else if (meta == ""){
        media = "...";
        mediaTitle = "Aluno sem nota definida";
        break;
      } else {
        media = "...";
        mediaTitle = "Nota não reconhecida";
        break;
      }
    }

    if (media !== "..."){
      media = this.studentAverageFormula(MAs, MPAs, MANAs);
      mediaTitle = this.studentAverageTitle(media);
    }

    aluno.media = media;
    aluno.mediaTitle = mediaTitle;
  }

  studentAverageFormula(MAs: number, MPAs: number, MANAs: number): string {
    let numeroTotaldeNotas = MAs+MPAs+MANAs;
    let notasPositivas = MAs+MPAs;

    if(MANAs == 0) {
      if (MAs/numeroTotaldeNotas >= 0.9)
        return "10";
      if (MAs/numeroTotaldeNotas >= 0.8)
        return "9.5";
      if (MAs/numeroTotaldeNotas >= 0.7)
        return "9";
      if (MAs/numeroTotaldeNotas >= 0.5)
        return "8.5";
      if (MAs/numeroTotaldeNotas >= 0.4)
        return "8";
      if (MAs/numeroTotaldeNotas >= 0.2)
        return "7.5";
      else
        return "7";
    } else {
      if (notasPositivas/numeroTotaldeNotas >= 0.9)
        return "6.5";
      if (notasPositivas/numeroTotaldeNotas >= 0.8)
        return "6";
      if (notasPositivas/numeroTotaldeNotas >= 0.7)
        return "5.5";
      if (notasPositivas/numeroTotaldeNotas >= 0.6)
        return "5";
      if (notasPositivas/numeroTotaldeNotas >= 0.5)
        return "4.5";
      if (notasPositivas/numeroTotaldeNotas >= 0.4)
        return "4";
      if (notasPositivas/numeroTotaldeNotas >= 0.3)
        return "3";
      if (notasPositivas/numeroTotaldeNotas >= 0.2)
        return "2";
      if (notasPositivas/numeroTotaldeNotas >= 0.1)
        return "1";
      if (notasPositivas >= 1)
        return "0.5";
      else
        return "0";
    }
  }

  studentAverageTitle(media: string): string {
    let mediaNumber = Number(media);

    if (mediaNumber >= 7)
      return "Aprovado por média"
    else if (mediaNumber >= 3)
      return "Final"
    else
      return "Reprovado"
  }

}
