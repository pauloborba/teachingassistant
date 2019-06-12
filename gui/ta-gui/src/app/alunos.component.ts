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
   detalhes: boolean = false;
   showDetalhes(a: Aluno): void{
      this.detalhes = !this.detalhes;
      
   }
   criarAluno(a: Aluno): void {
     this.alunoService.criar(a)
        .then(ab => {
           if (ab) {
              this.alunos.push(ab);
              this.aluno = new Aluno();
           } else {
              this.cpfduplicado = true;
           }
        })
        .catch(erro => alert(erro));
   }

   removerAluno(a: Aluno): void{
      this.alunoService.remover(a)
      .then(ab =>{
         if(ab){
            var aux = this.alunos.findIndex(tr => tr.cpf === ab.cpf);
            var randm = this.alunos.splice(aux,1);
         }
      })
      .catch(erro => alert(erro));
   }
   onMove(): void {
      this.cpfduplicado = false;
   }

   ngOnInit(): void {
     this.alunoService.getAlunos()
         .then(as => this.alunos = as)
         .catch(erro => alert(erro));
   }

}
