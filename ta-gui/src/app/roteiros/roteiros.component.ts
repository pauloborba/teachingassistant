import { Component, OnInit } from '@angular/core';

import { Roteiro } from '../../../../ta-server/roteiro';
import { BlocoDeQuestoes } from '../../../../ta-server/blocodequestoes';

@Component({
  selector: 'app-roteiros',
  templateUrl: './roteiros.component.html',
  styleUrls: ['./roteiros.component.css']
})
export class RoteirosComponent implements OnInit {
  roteiro: Roteiro;
  roteiros: Roteiro[] = [];
  questoes: BlocoDeQuestoes;
  constructor() { }
  
  ngOnInit() {

  }
  
  criarRoteiro(roteiro: Roteiro): void { }
  deletarRoteiro(roteiro: Roteiro): void { }
  atualizarRoteiro(roteiro: Roteiro): void { }
}
