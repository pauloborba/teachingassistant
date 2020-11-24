import { Component, OnInit } from '@angular/core';
import { Turma } from '../../../../common/turma';
import {Router} from '@angular/router'


@Component({
  selector: 'app-turmas',
  templateUrl: './turmas.component.html',
  styleUrls: ['./turmas.component.css']
})
export class TurmasComponent implements OnInit {
  turmas: Turma[] = [];

  constructor(private router:Router) { }

  ngOnInit() {

  }

  onAdicionar(){
    
  }
}
