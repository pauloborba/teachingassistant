import { Meta } from "../app/meta"

export class Aluno {
  nome: string;
  cpf: string;
  email: string;
  metas: Map<string,Meta>;

  constructor() {
    this.clean();
  }

  clean(): void {
    this.nome = "";
    this.cpf = "";
    this.email = "";
    this.metas = new Map<string,Meta>();
  }

  clone(): Aluno {
    var aluno: Aluno = new Aluno();
    aluno.metas = new Map<string,Meta>();
    aluno.copyFrom(this);
    return aluno;
  }

  copyFrom(from: Aluno): void {
    this.nome = from.nome;
    this.cpf = from.cpf;
    this.email = from.email;
    this.copyMetasFrom(from.metas);
  }

  copyMetasFrom(from: Map<string,Meta>): void {
    this.metas = new Map<string,Meta>();
    for (let key in from) {
      this.metas[key] = from[key];
    }
  }
}
