import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from '../../../common/aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  templateUrl: './metas.component.html',
  styleUrls: ['./metas.component.css']
})
export class MetasComponent implements OnInit{
  constructor(private alunoService: AlunoService){}

  alunos: Aluno[] = [];

  ngOnInit(): void{
    this.alunos = this.alunoService.getAlunos();
  }

  atualizarAluno(aluno: Aluno): void{
    this.alunoService.atualizarMetas(aluno);
  }
}
