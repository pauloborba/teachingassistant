import { Avaliacao } from './avaliacao';

export class Aluno {
  nome: string;
  cpf: string;
  email: string;
  metas: Map<string,string>;
  avaliacoes: Map<Avaliacao,string>;

  constructor() {
    this.clean();
  }

  clean(): void {
    this.nome = "";
    this.cpf = "";
    this.email = "";
    this.metas = new Map<string,string>();
    this.avaliacoes = new Map<Avaliacao,string>();
  }

  clone(): Aluno {
    var aluno: Aluno = new Aluno();
    aluno.metas = new Map<string,string>();
    aluno.avaliacoes = new Map<Avaliacao,string>();
    aluno.copyFrom(this);
    return aluno;
  }

  copyFrom(from: Aluno): void {
    this.nome = from.nome;
    this.cpf = from.cpf;
    this.email = from.email;
    this.copyMetasFrom(from.metas);
    this.copyAvaliacoesFrom(from.avaliacoes);
  }

  copyMetasFrom(from: Map<string,string>): void {
    this.metas = new Map<string,string>();
    for (let key in from) {
      this.metas[key] = from[key];
    }
  }
  copyAvaliacoesFrom(from: Map<Avaliacao,string>): void {
    this.avaliacoes = new Map<Avaliacao,string>();
    for (let key in from) {
      this.avaliacoes[key] = from[key];
    }
  }
}
