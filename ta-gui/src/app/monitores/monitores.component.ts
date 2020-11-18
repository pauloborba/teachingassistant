import { Component, OnInit } from '@angular/core';

import { Aluno } from '../../../../common/aluno';
import { Turma } from '../../../../common/turma';

@Component({
  selector: 'app-monitores',
  templateUrl: './monitores.component.html',
  styleUrls: ['./monitores.component.css']
})
export class MonitoresComponent implements OnInit {
  alunos: Aluno[] = [];
  turma: Turma;  
  constructor() { }
  
  ngOnInit() {

  }

  listarMonitores(turma: Turma): Aluno[] {
    return [];
  }
}
