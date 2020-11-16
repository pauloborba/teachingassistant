import { Component, OnInit } from '@angular/core';
import { Turma } from '../../../../common/turma';

@Component({
  selector: 'app-turmas',
  templateUrl: './turmas.component.html',
  styleUrls: ['./turmas.component.css']
})
export class TurmasComponent implements OnInit {
  turmas: Turma[] = [];

  constructor() { }

  ngOnInit() {

  }
}
