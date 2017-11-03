import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'autoavaliacao',
  templateUrl: './autoavaliacao.component.html',
  styleUrls: ['./autoavaliacao.component.css']
})
export class AutoavaliacaoComponent implements OnInit {
   constructor(private alunoService: AlunoService) {}

   alunos: Aluno[];
   aluno: Aluno;

   formarAluno(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));

      //alert((<HTMLInputElement>document.getElementById('cpfbox')).value);
      this.aluno = this.alunos.find(a => a.cpf == (<HTMLInputElement>document.getElementById('cpfbox')).value);
      //alert("Aluno: "+this.aluno.nome+" "+this.aluno.cpf);

      var radios = document.getElementsByName('req');

      for (var i = 0, length = radios.length; i < length; i++){
        if ((<HTMLInputElement>radios[i]).checked){
          alert("Meta"+this.aluno.autoavaliacao['requisitos']);
          this.aluno.autoavaliacao['requisitos']=(<HTMLInputElement>radios[i]).value;
          alert("Meta"+this.aluno.autoavaliacao['requisitos']);
        }
      }

      radios = document.getElementsByName('con');

      for (var i = 0, length = radios.length; i < length; i++){
        if ((<HTMLInputElement>radios[i]).checked){
          alert("Meta"+this.aluno.autoavaliacao['gerDeConfiguracao']);
          this.aluno.autoavaliacao['gerDeConfiguracao']=(<HTMLInputElement>radios[i]).value;
          alert("Meta"+this.aluno.autoavaliacao['gerDeConfiguracao']);
        }
      }

      this.aluno.jaRespondeu=true;

      this.atualizarAluno(this.aluno);
   }

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
