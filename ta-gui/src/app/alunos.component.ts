import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from '../../../common/aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  templateUrl: './alunos.component.html',
  styleUrls: ['./alunos.component.css']
})
export class AlunosComponent implements OnInit {
  constructor(private alunoService: AlunoService){}

  ngOnInit(): void{
    this.alunos = this.alunoService.getAlunos();
  }

  aluno: Aluno = new Aluno();
  alunos: Aluno[] = [];
  cpfDuplicado: Boolean = false;

  criarAluno(a: Aluno): void{
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
}
