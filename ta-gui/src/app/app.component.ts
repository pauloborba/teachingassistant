import { Component } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from '../../../common/aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  constructor(private alunoService: AlunoService){}

  title = 'ta-gui-modificação';
  aluno: Aluno = new Aluno();

  alunos: Aluno[] = [];
  cpfDuplicado: Boolean = false;

  criarAluno(a: Aluno){
    if(this.alunoService.criar(a)){
      this.alunos.push(a);
      this.aluno = new Aluno();
    }else{
      this.cpfDuplicado = true;
    }
  }

  onMove(): void {
    this.cpfDuplicado = false;
  }

  atualizarAluno(aluno: Aluno): void{
    this.alunoService.atualizarMetas(aluno);
  }

}
