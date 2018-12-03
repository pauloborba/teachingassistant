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

   atualizarAluno(aluno: Aluno): boolean {
      var noTypo = true;
      var value;
      Object.keys(aluno.metas).forEach(function(key) {
          value = aluno.metas[key];
          if (value != "MANA" && value != "MPA" && value != 'MA'){
            noTypo = false;
            alert("Can't compute grade '" + value + "'\nPlease type MANA, MPA or MA.");
          }
      }); 
      if(noTypo) this.alunoService.atualizar(aluno)
                    .catch(erro => alert(erro));
      return noTypo;
   }

   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));
   }

}
