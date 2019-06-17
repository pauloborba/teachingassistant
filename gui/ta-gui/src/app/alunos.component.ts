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
              this.alunos.push(ab);
              this.aluno = new Aluno();
           } else {
            if(this.alunos.find(ab => ab.cpf==this.aluno.cpf)){
               this.cpfduplicado = true;
            }
            if(this.alunos.find(ab => ab.logingithub==this.aluno.logingithub)){
               this.githubduplicado = true;
            }
           }
        })
        .catch(erro => alert(erro));
   }
   removerAluno(a: Aluno): void{
      this.alunoService.remover(a)
      .then( ab => 
        this.alunos=this.alunos.filter(ab => ab.cpf!=this.aluno.cpf)
             )
             .catch(erro => alert(erro));
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