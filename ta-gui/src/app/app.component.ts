import { Component } from '@angular/core';
import { NgModule } from '@angular/core';

import {Aluno} from './aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  constructor(private alunoService: AlunoService){}

  title = 'ta-gui-modificação';
  aluno: Aluno = {nome: "", cpf: "", email: "", github: ""};

  alunos: Aluno[] = [];
  cpfDuplicado: Boolean = false;

  gravar(a: Aluno){
    if(this.alunoService.gravar(a)){
      this.alunos.push(a);
      this.aluno = {nome: "", cpf: "", email: "", github: ""}
    }else{
      this.aluno.cpf = "";
      this.cpfDuplicado = true;
    }
  }

  onMove(): void {
    this.cpfDuplicado = false;
  }

}
