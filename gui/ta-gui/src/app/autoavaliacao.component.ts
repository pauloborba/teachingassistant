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


      this.aluno = this.alunos.find(a => a.cpf == (<HTMLInputElement>document.getElementById('cpfbox')).value);

      if(!this.aluno){
        alert("Aluno com cpf não cadastrado");
      }

      else if(this.aluno.jaRespondeu){
        alert("Aluno já respondeu autoavaliação");
      }

      else{
      var radios = document.getElementsByName('req');
      var campovazio=true;

      for (var i = 0, length = radios.length; i < length; i++){
        if ((<HTMLInputElement>radios[i]).checked){
          this.aluno.autoavaliacao['requisitos']=(<HTMLInputElement>radios[i]).value;
          campovazio=false;
          break;
        }
      }

      radios = document.getElementsByName('con');

      campovazio=true;
      for (var i = 0, length = radios.length; i < length; i++){
        if ((<HTMLInputElement>radios[i]).checked){
          this.aluno.autoavaliacao['gerDeConfiguracao']=(<HTMLInputElement>radios[i]).value;
          campovazio=false;
          break;
        }
      }

      if(!campovazio){
        this.aluno.jaRespondeu=true;

        this.atualizarAluno(this.aluno);
	
	alert("Autoavaliação enviada");
      }
      else{
        alert("Falta preencher campo(s)")
      }
      }
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
