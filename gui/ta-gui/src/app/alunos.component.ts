import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  templateUrl: './alunos.component.html',
  styleUrls: ['./alunos.component.css']
})
export class AlunosComponent implements OnInit {
   constructor(private alunoService: AlunoService) {}

   aluno: Aluno = new Aluno();
   alunos: Aluno[];
   cpfduplicado: boolean = false;
   githubduplicado: boolean = false;

   criarAluno(a: Aluno): void {
     this.alunoService.criar(a)
        .then(ab => {
           if (ab) {
              if(ab.github != "-1") {
                console.log(ab);
                this.alunos.push(ab);
                this.aluno = new Aluno();
              } else {
                this.githubduplicado = true;
              }
           } else {
              this.githubduplicado = true;
           }
        })
        .catch(erro => alert(erro));
   }

   removerAluno(a: Aluno) : void {
    this.alunoService.remover(a).then(as => this.alunos.splice(this.alunos.findIndex(ab => ab.cpf == a.cpf), 1))
      .catch(err => alert(err))
   }

   onMove(): void {
    this.cpfduplicado = false;
    this.githubduplicado = false;
   }

   ngOnInit(): void {
     this.alunoService.getAlunos()
         .then(as => this.alunos = as)
         .catch(erro => alert(erro));
   }

}
