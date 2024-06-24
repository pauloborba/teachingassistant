export class Aluno {
    nome: string;
    cpf: string;
    email: string;
    github: string;
    metas: Map<string,string>;
  
    constructor() {
      this.clean();
    }
  
    clean(): void {
    this.nome = "";
    this.cpf = "";
    this.email = "";
    this.github = "";
    this.metas = new Map<string,string>();
  }

  clone(): Aluno {
    var aluno: Aluno = new Aluno();
    aluno.copyFrom(this);
    return aluno;
  }

  copyFrom(from: Aluno): void {
    this.nome = from.nome;
    this.cpf = from.cpf;
    this.email = from.email;
    this.github = from.github;
    this.copyMetasFrom(from.metas);
  }

  copyMetasFrom(from: Map<string,string>): void {
    this.metas = new Map<string,string>();
    for (let key in from) {
      this.metas[key] = from[key];
    }
  }
} 