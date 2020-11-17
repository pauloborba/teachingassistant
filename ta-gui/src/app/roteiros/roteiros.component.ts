import { Component, OnInit } from '@angular/core';

import { Roteiro } from '../../../../ta-server/roteiro';

@Component({
  selector: 'app-roteiros',
  templateUrl: './roteiros.component.html',
  styleUrls: ['./roteiros.component.css']
})
export class RoteirosComponent implements OnInit {
  roteiro: Roteiro;
  roteiros: Roteiro[] = [];
  
  constructor() { }
  
  ngOnInit() {

  }
  
  criarRoteiro(roteiro: Roteiro): void { }
  deletarRoteiro(roteiro: Roteiro): void { }
  atualizarRoteiro(roteiro: Roteiro): void { }
}
