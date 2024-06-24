import { Component, OnInit } from '@angular/core';
import { Aluno } from '../../../common/aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  templateUrl: './alunos.component.html',
  styleUrls: ['./alunos.component.css']
})
export class AlunosComponent implements OnInit {

   aluno: Aluno = new Aluno();
   alunos: Aluno[] = [];
   cpfduplicado: boolean = false;
   githubExistente: boolean = false;

   constructor(private alunoService: AlunoService) {}

   criarAluno(a: Aluno): void {
    this.alunoService.criar(a)
    .subscribe(
      ar => {
        if (ar != "cpf") {
          if(ar != "github"){
            this.alunos.push(ar);
            this.aluno = new Aluno();
          } else { 
            this.githubExistente = true 
          }
        } else {
          this.cpfduplicado = true;
        } 
      },
      msg => { alert(msg.message); }
    );
   }

   removerAluno(cpf: String): void{
     this.alunoService.deletar(cpf).subscribe(
      ar => {
        if (ar == cpf) {
          this.alunos.find(a => {if (a.cpf == cpf){this.alunos.splice(this.alunos.indexOf(a), 1)}});
        } else {
          msg => { alert(msg.message)
        } 
      }
     })
   }

   onMove(): void {
      this.cpfduplicado = false;
      this.githubExistente = false;
   }

   ngOnInit(): void {
    this.alunoService.getAlunos()
    .subscribe(
      as => { this.alunos = as; },
      msg => { alert(msg.message); }
     );
   }

}