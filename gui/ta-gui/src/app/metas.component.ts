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
   listaMetas = document.getElementsByClassName("listaMetas");
   metasAutoAvaliadas = document.getElementsByClassName("metaAutoAvaliacao");
   isVisible = false;

   atualizarAluno(aluno: Aluno): void {
      this.alunoService.atualizar(aluno)
         .catch(erro => alert(erro));
   }

   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));
   }

   verDiscrepancias(): void {
    
    this.mostrarTabela();
    if(!this.isVisible) {
      for(let i = 0; i < this.alunos.length; i++) {
        if(this.haDiscrepancia(this.alunos[i])) 
          this.listaMetas.item(i).setAttribute("style", "background-color: #ec1c24; color: #fff");
      }
    }
    this.isVisible = !this.isVisible;

   }

   haDiscrepancia(aluno: Aluno) {
    let numDiscrepancias = 0; 
    
      if(this.conceitoDiscrepante("requisitos", aluno.metas, aluno.metasAutoAvaliacao))
        numDiscrepancias++;
      if(this.conceitoDiscrepante("gerdeConfiguracao", aluno.metas, aluno.metasAutoAvaliacao))
        numDiscrepancias++;

    if(numDiscrepancias >= Math.ceil(2 * 0.25))
      return true;
    return false;

   }

   conceitoDiscrepante(conceito: string, metas, metasAutoAvaliacao) {
    if(
      (metasAutoAvaliacao[conceito] == "MA" && metas[conceito] == "MPA") ||
      (metasAutoAvaliacao[conceito] == "MA" && metas[conceito] == "MANA") ||
      (metasAutoAvaliacao[conceito] == "MPA" && metas[conceito] == "MANA"))
        return true;
    return false; 
   }

   mostrarTabela(): void {
     if(this.isVisible) 
        this.setInvisible();
     else
      for (let index = 0; index < this.metasAutoAvaliadas.length; index++) 
        this.metasAutoAvaliadas[index].setAttribute("style", "display:inline-block;");  
   }

   setInvisible(): void {
    for (let index = 0; index < this.metasAutoAvaliadas.length; index++) 
      this.metasAutoAvaliadas[index].removeAttribute("style");
    for(let i = 0; i < this.alunos.length; i++) 
      this.listaMetas.item(i).setAttribute("style", "background-color: #fff; color: #000");
    
   }

}
