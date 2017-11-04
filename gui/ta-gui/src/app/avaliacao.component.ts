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

   aluno: Aluno = new Aluno();
   alunos: Aluno[];
   cpfexiste: boolean = false;
   completa: boolean = false;

   enviarAval(aluno: Aluno) {
       this.nullNorEmpty(aluno);
       if (this.completa) {
        this.alunoService.atualizar(aluno)
        .catch(erro => alert(erro));
       }
   }

   localizarAluno(nome: string, cpf: string) {
    for (let a of this.alunos) {
        if (a.nome === nome && a.cpf === cpf) {
            this.aluno = a;
            return this.cpfexiste = true;
        }
    }
   }

   nullNorEmpty(aluno: Aluno): boolean {
       if (Object.keys(aluno.avaliacao).length === Object.keys(aluno.metas).length) {
            for (let key in aluno.metas) {
                if (aluno.avaliacao[key] === '' || aluno.avaliacao[key] == null) {
                    return this.completa = false;
                }
            }
            return this.completa = true;
       }
   }

   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));
   }


}
