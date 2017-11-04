import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
    selector: 'metas',
    templateUrl: './metas.component.html',
    styleUrls: ['./metas.component.css']
})
export class MetasComponent implements OnInit {
    constructor(private alunoService: AlunoService) {}

    alunos: Aluno[];

    atualizarAluno(aluno: Aluno): void {
	if (!aluno.metas["gerDeConfiguracao"]) {
	    aluno.metas["gerDeConfiguracao"] = "";
	}
	if (!aluno.metas["requisitos"]) {
	    aluno.metas["requisitos"] = "";
	}
	this.alunoService.atualizar(aluno)
            .catch(erro => alert(erro));
    }

    ngOnInit(): void {
	this.alunoService.getAlunos()
            .then(alunos => this.alunos = alunos)
            .catch(erro => alert(erro));
    }

}
