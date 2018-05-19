export class Aluno {
  nome: string;
  cpf: string;
  email: string;
  metas: Map<string,string>;
  metasAutoAvaliacao: Map<string, string>;

  constructor() {
    this.clean();
  }

  clean(): void {
    this.nome = "";
    this.cpf = "";
    this.email = "";
    this.metas = new Map<string,string>();
    this.metasAutoAvaliacao = new Map<string, string>();
  }

  clone(): Aluno {
    var aluno: Aluno = new Aluno();
    aluno.metas = new Map<string,string>();
    aluno.metasAutoAvaliacao = new Map<string, string>();
    aluno.copyFrom(this);
    return aluno;
  }

  copyFrom(from: Aluno): void {
    this.nome = from.nome;
    this.cpf = from.cpf;
    this.email = from.email;
    this.copyMetasFrom(this.metas, from.metas);
    this.copyMetasFrom(this.metasAutoAvaliacao, from.metasAutoAvaliacao);
  }

  copyMetasFrom(metas: Map<string, string>, from: Map<string,string>): void {
    metas = new Map<string,string>();
    for (let key in from) {
      metas[key] = from[key];
    }
  }
}
