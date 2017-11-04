import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'autoavaliacao',
  templateUrl: './autoavaliacao.component.html',
  styleUrls: ['./autoavaliacao.component.css']
})
export class AutoAvaliacaoComponent implements OnInit {
   constructor(private alunoService: AlunoService) {}
  
  aluno_naocadastrado: boolean = false;
  autoav_incompleta: boolean = false;
  autoav_enviada:boolean = false;
  aluno:Aluno = new Aluno()
  alunos: Aluno[];
  requisitos: String;
  testes: String;
  controle: String;

  enviarAutoAvaliacao(a: Aluno): void { 
    this.alunoService.getAlunos().then(alunos =>{
      this.aluno_naocadastrado = this.existeAluno(a, alunos);
      this.autoav_incompleta = this.autoavIncompleta(a, alunos);
      if(!this.aluno_naocadastrado && !this.autoav_incompleta){
        this.atualizarAluno(a);
        this.autoav_enviada = true;
        console.log("enviando");
      }
     }
    ).catch(erro=> console.error(erro));
  
  }
  existeAluno(a: Aluno, alunos: Aluno[]): boolean {
    var existe = false;
      for(var i = 0; i < alunos.length; i++){
        if(a.nome === alunos[i].nome && a.cpf === alunos[i].cpf){
          existe = true;
        }
      }
      return !existe;
  }
  autoavIncompleta(a: Aluno, alunos: Aluno[]): boolean {
    var meta = null;
    var incompleta = false;
      if(a.autoav['mot_requisitos'] == null) {
        meta = document.getElementById("req");
        meta.style.backgroundColor = "#db0202";
        incompleta = true;
      }else{ 
        meta = document.getElementById("req");
        meta.style.backgroundColor = "white";
      }
      if(a.autoav['mot_testes'] == null){
        meta = document.getElementById("test");
        meta.style.backgroundColor = "#db0202";
        incompleta = true;
      }else{ 
        meta = document.getElementById("test");
        meta.style.backgroundColor = "white";
      }
      if(a.autoav['uso_controleversao'] == null){
        meta = document.getElementById("cont");
        meta.style.backgroundColor = "#db0202";
        incompleta = true;
      }else{ 
        meta = document.getElementById("cont");
        meta.style.backgroundColor = "white";
      }
    return incompleta;
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
