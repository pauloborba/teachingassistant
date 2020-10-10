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
    duplicado: boolean = false;

    constructor(private alunoService: AlunoService) {}

     criarAluno(a: Aluno): void {
       this.alunoService.criar(a)
              .subscribe(
                ar => {
                  if (ar) {
                    this.alunos.push(ar);
                    this.aluno = new Aluno();
                  } else {
                    this.duplicado = true;
                  } 
                },
                msg => { alert(msg.message); }
              );
      // alert("Já executei o criar e o subscribe!");
    }

    deletarAluno(a: Aluno): void {
      this.alunoService.deletar(a)
             .subscribe(
               as => {
                 if (as!= null) {
                   this.alunos = as;
                 } else {
                    alert('Aluno não deletado.');
                 } 
               },
               msg => { alert(msg.message); }
             );
    } 

    onMove(): void {
       this.duplicado = false;
    }

     ngOnInit(): void {
       this.alunoService.getAlunos()
             .subscribe(
               as => { this.alunos = as; },
               msg => { alert(msg.message); }
              );
     }

  }