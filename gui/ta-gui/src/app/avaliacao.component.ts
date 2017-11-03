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
   aluno: Aluno;
   cpfexiste: boolean = false;

   atualizarAluno(aluno: Aluno): void {
      this.alunoService.atualizar(aluno)
         .catch(erro => alert(erro));
         console.log('atualizou aluno');
   }

   localizarAluno(aluno: Aluno) {
    this.aluno = aluno;
    console.log(this.aluno);
    for (let a of this.alunos) {
        if (a.nome === this.aluno.nome && a.cpf === this.aluno.cpf) {
            return this.cpfexiste = true;
        }
    }
   }

//    localizarAluno(aluno: Aluno) {
//     this.aluno = aluno;
//     if (this.cpfNaoexistente(aluno)) {
//         this.cpfexiste = false;
//         console.log('nao encontrou aluno');
//     } else {
//         this.cpfexiste = true;
//         console.log('encontrou aluno');
//     }
//    }

    // cpfNaoexistente(aluno: Aluno): boolean {
    //     return !this.alunos.find(a => a.cpf === aluno.cpf && a.nome === aluno.nome);
    // }

   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));
         console.log(this.alunos);
   }


}
