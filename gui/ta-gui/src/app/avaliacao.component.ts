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
   cpfexiste: boolean;

   atualizarAluno(aluno: Aluno): void {
      this.alunoService.atualizar(aluno)
         .catch(erro => alert(erro));
   }

   localizarAluno(aluno) {
    if (this.cpfNaoexistente(aluno)) {
        this.cpfexiste = false;
    } else {
        this.cpfexiste = true;
    }
   }

    cpfNaoexistente(aluno: Aluno): boolean {
        return !this.alunos.find(a => a.cpf === aluno.cpf && a.nome === aluno.nome);
    }

   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));
   }


}
