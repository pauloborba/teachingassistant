import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
    selector: 'selfmetas',
    templateUrl: './selfmetas.component.html',
    styleUrls: ['./selfmetas.component.css']
})
export class SelfMetasComponent implements OnInit {
    constructor(private alunoService: AlunoService) {}

    alunos: Aluno[];

    autoAvaliarAluno(aluno: Aluno): void {
	if (!aluno.selfmetas["gerDeConfiguracao"]) {
	    aluno.selfmetas["gerDeConfiguracao"] = "";
	}
	if (!aluno.selfmetas["requisitos"]) {
	    aluno.selfmetas["requisitos"] = "";
	}
	this.alunoService.autoAvaliar(aluno)
	    .then(result => {
		if (!result) {
		    alert("Não foi possível auto avaliar");
		}
	    })
	    .catch(erro => alert(erro));
    }

    ngOnInit(): void {
	this.alunoService.getAlunos()
            .then(alunos => this.alunos = alunos)
            .catch(erro => alert(erro));
    }

}
