import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-adicionar-turma',
  templateUrl: './adicionar-turma.component.html',
  styleUrls: ['./adicionar-turma.component.css']
})
export class AdicionarTurmaComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

  adicionarTurma(){
    console.log("oi")
  }

}
