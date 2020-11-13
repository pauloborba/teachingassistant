import { Component, OnInit } from '@angular/core';

//import { Roteiro } from '../../../common/roteiro';
//import { RoteiroService } from './roteiro.service';

  @Component({
   selector: 'roteiros',
   templateUrl: './roteiros.component.html',
   styleUrls: ['./roteiros.component.css']
 })
 export class RoteirosComponent implements OnInit {

    roteiro: Roteiro = new Roteiro();
    roteiros: Roteiro[] = [];

     criarRoteiro(roteiro: Roteiro): void {}
     deletarRoteiro(roteiro: Roteiro): void{}
     atualizarRoteiro(roteiro: Roteiro): void{}

}
