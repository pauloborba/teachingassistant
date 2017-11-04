export class Aluno {
    nome: string;
    cpf: string;
    email: string;
    metas: Map<string,string>;
    selfmetas: Map<string,string>;

    constructor() {
	this.clean();
    }

    clean(): void {
	this.nome = "";
	this.cpf = "";
	this.email = "";
	this.metas = new Map<string,string>();
	this.selfmetas = new Map<string,string>();
    }

    clone(): Aluno {
	var aluno: Aluno = new Aluno();
	aluno.metas = new Map<string,string>();
	aluno.selfmetas = new Map<string,string>();
	aluno.copyFrom(this);
	return aluno;
    }

    copyFrom(from: Aluno): void {
	this.nome = from.nome;
	this.cpf = from.cpf;
	this.email = from.email;
	this.copyMetasFrom(from);
    }

    copyMetasFrom(from: Aluno): void {
	this.metas = new Map<string,string>();
	this.selfmetas = new Map<string,string>();
	for (let key in from.metas) {
	    this.metas[key] = from.metas[key];
	}
	for (let key in from.selfmetas) {
	    this.selfmetas[key] = from.selfmetas[key];
	}
    }
}
