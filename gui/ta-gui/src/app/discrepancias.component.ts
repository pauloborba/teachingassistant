import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
    selector: 'discrepancias',
    templateUrl: './discrepancias.component.html'
})
export class DiscrepanciasComponent implements OnInit {

    constructor(private alunoService:AlunoService) {}
    discdetect = false;
    alunos: Aluno[];
    alunosdiscrepantes: Aluno[];
    discrepante: Map<string, string>;
    total: string;
    pctg: string;

    ngOnInit(): void {
	this.alunoService.getAlunos()
	    .then(alunos => {
		this.alunos = alunos
		this.alunosdiscrepantes = [];
		this.discrepante = new Map<string,string>();
		this.buscaDiscrepantes();
		this.total = "total: " + this.alunosdiscrepantes.length;
		var p = Math.round(this.alunosdiscrepantes.length/this.alunos.length*100);
		this.pctg = isNaN(p) ? "0" : p + "";
		this.pctg = "porcentagem: " + this.pctg + "%";
	    })
	    .catch(erro => alert(erro));
    }
    
    buscaDiscrepantes(): void {
	var i = 0;
	for (let a of this.alunos) {
	    var discrepa = this.contaDiscrepancia(a);
	    if (discrepa) {
		this.discdetect = true;
		this.alunosdiscrepantes.push(a);
		this.discrepante[a.cpf] = true;
		i += 1;
	    } else {
		this.discrepante[a.cpf] = false;
	    }

	}
    }

    contaDiscrepancia(a: Aluno): boolean {
	var l = Object.keys(a.selfmetas).length;
	var i = 0;
	for (var key in a.selfmetas) {
	    if (a.selfmetas.hasOwnProperty(key) &&
		a.metas.hasOwnProperty(key) &&
		a.selfmetas[key] != a.metas[key]) {
		i += 1;
	    }
	}
	return (i/l >= 1/3);
    }
}
