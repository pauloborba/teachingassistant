import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';
import { $ } from 'protractor';

@Component({
  selector: 'metas',
  templateUrl: './metas.component.html',
  styleUrls: ['./metas.component.css']
})
export class MetasComponent implements OnInit {
   constructor(private alunoService: AlunoService) {}

   alunos: Aluno[];

   atualizarAluno(aluno: Aluno, meta: String, person: String, cpf: Number): boolean {
      var noTypo = true;
      var value;
      var pastValue = "";
      Object.keys(aluno.metas).forEach(function(key) {
          value = aluno.metas[key];
          if (value != "MANA" && value != "MPA" && value != 'MA'){
            noTypo = false;
            alert("Can't compute grade '" + value + "'\nPlease type MANA, MPA or MA.");
          }
          var discrep = false;
          if (noTypo && person == "Prof") {
            if (pastValue == "MPA" && value == "MANA") discrep = true;
            if (pastValue == "MA" && (value == "MANA" || value == "MPA")) discrep = true;
          }
          if (discrep) {
            alert(meta + " of the student with CFP " + cpf + " has discrepancy \n(" + pastValue + " -> " + value + ")");
          }
          pastValue = value;
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
