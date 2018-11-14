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
      this.alunoService.atualizar(aluno)
         .catch(erro => alert(erro));
   }



   disc(alunos: Aluno[]): any {
     let totalAl = alunos.length;
     let totalDisc = 0;
     let nomes = [];
     alunos.forEach(a => {
       if((a.metas['requisitos'] === 'MANA' && (a.autoAvaliacao['requisitos'] === 'MPA' || a.autoAvaliacao['requisitos'] === 'MA') )) {
         totalDisc++;
         nomes.push(a.nome);
       } else if ((a.metas['requisitos'] === 'MPA' && a.autoAvaliacao['requisitos'] === 'MA') ) {
         totalDisc++;
         nomes.push(a.nome);
       } else if((a.metas['gerDeConfiguracao'] === 'MANA' && (a.autoAvaliacao['gerDeConfiguracao'] === 'MPA' || a.autoAvaliacao['gerDeConfiguracao'] === 'MA') )) {
        totalDisc++;
        nomes.push(a.nome);
      } else if ((a.metas['gerDeConfiguracao'] === 'MPA' && a.autoAvaliacao['gerDeConfiguracao'] === 'MA') ) {
        totalDisc++;
        nomes.push(a.nome);
      }
     })
     return ({
       total: totalAl,
       discrepantes: totalDisc,
       percentual: totalDisc/totalAl,
       nomes: nomes
     })
   }

   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));
      let d = this.disc(this.alunos);
   }

}
