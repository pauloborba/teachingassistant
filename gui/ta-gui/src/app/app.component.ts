import { Component } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  constructor(private alunoService: AlunoService) { }

  aluno: Aluno = new Aluno();
  alunos: Aluno[] = [];
  cpfduplicado: boolean = false;
  githubduplicado: boolean = false;

  criarAluno(a: Aluno): void {
    this.alunoService.criar(a)
      .then(b => {
        if (b) {
          console.log(b);
          if (b.github != "-1") {
            this.alunos.push(a);
            this.aluno = new Aluno();
          } else {
            this.githubduplicado = true;
          }
        } else {
          this.githubduplicado = true;
        }
      }).catch(err => alert(err))
  }

  onMove(): void {
    this.cpfduplicado = false;
    this.githubduplicado = false;
  }

}
