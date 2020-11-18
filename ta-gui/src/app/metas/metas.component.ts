import { Component, OnInit } from '@angular/core';

// Comentado pois não existe Aluno em common ainda
import { Aluno } from '../../../../common/aluno';

@Component({
  selector: 'app-metas',
  templateUrl: './metas.component.html',
  styleUrls: ['./metas.component.css']
})
export class MetasComponent implements OnInit {
  alunos: Aluno[] = [];

  constructor() { }

  ngOnInit() {

  }

  atualizarAluno(aluno: Aluno): void {

  }
}
