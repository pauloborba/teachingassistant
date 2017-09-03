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
  title = 'ta-gui';
   aluno: Aluno = {nome: "", cpf: "", email: ""};
   alunoService = new AlunoService();
   alunos: Aluno[] = [];
   cpfduplicado: boolean = false;

   gravar(a: Aluno): void {
     if (this.alunoService.gravar(a)) {
       this.alunos.push(a);
       this.aluno = {nome: "", cpf: "", email: ""};
     } else {
       this.cpfduplicado = true;
     }
  }
  onMove(): void {
      this.cpfduplicado = false;
  }
}
