import { Component, OnInit } from '@angular/core';

import { Aluno } from '../../../../common/aluno';

@Component({
  selector: 'app-alunos',
  templateUrl: './alunos.component.html',
  styleUrls: ['./alunos.component.css']
})
export class AlunosComponent implements OnInit {

  constructor() { }

  ngOnInit() {

  }

  criarAluno(a: Aluno): void {

  }
}
