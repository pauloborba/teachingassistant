import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  templateUrl: './avaliacao.component.html',
  styleUrls: ['./avaliacao.component.css']
})
export class AvaliacaoComponent implements OnInit {
   constructor(private alunoService: AlunoService) {}

   alunos: Aluno[];
   cpfexiste = true;

   localizarAluno(aluno) {
    if (this.cpfexistente(aluno)) {
        this.cpfexiste = true;
    } else {
        this.cpfexiste = false;
    }
   }

    cpfexistente(aluno: Aluno): boolean {
        return !this.alunos.find(a => a.cpf === aluno.cpf && a.nome === aluno.nome);
    }

   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));
   }


}
