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

    constructor(private alunoService: AlunoService) {}

    deletar(cpf) {
      this.alunoService.deletar(cpf)
        .subscribe(
          ar => {
            if (ar) {
              var i;
              for (i=0; i<this.alunos.length; i++) {
                if (this.alunos[i].cpf == cpf) {
                  break;
                }
              }
              this.alunos.splice(i, 1);
            }
          }
        )
    }

     criarAluno(a: Aluno): void {
       this.alunoService.criar(a)
              .subscribe(
                ar => {
                  if (ar) {
                    this.alunos.push(ar);
                    this.aluno = new Aluno();
                  } else {
                    this.cpfduplicado = true;
                  } 
                },
                msg => { alert(msg.message); }
              );
      alert("Já executei o criar e o subscribe");
    } 

    onMove(): void {
       this.cpfduplicado = false;
    }

     ngOnInit(): void {
       this.alunoService.getAlunos()
             .subscribe(
               as => { this.alunos = as; },
               msg => { alert(msg.message); }
              );
     }

  }