export class Aluno {
  nome: string;
  cpf: string;
  email: string;
  metas: Map<string,string>;
  autoavaliacao: Map<string,string>;
  jaRespondeu: boolean;

  constructor() {
    this.clean();
  }

  clean(): void {
    this.nome = "";
    this.cpf = "";
    this.email = "";
    this.metas = new Map<string,string>();
    this.autoavaliacao = new Map<string,string>();
    this.jaRespondeu=false;
  }

  clone(): Aluno {
    var aluno: Aluno = new Aluno();
    aluno.metas = new Map<string,string>();
    aluno.autoavaliacao = new Map<string,string>();
    aluno.copyFrom(this);
    return aluno;
  }

  copyFrom(from: Aluno): void {
    this.nome = from.nome;
    this.cpf = from.cpf;
    this.email = from.email;
    this.copyMetasFrom(from.metas);
  }

  copyMetasFrom(from: Map<string,string>): void {
    this.metas = new Map<string,string>();
    this.autoavaliacao= new Map<string,string>();
    for (let key in from) {
      this.metas[key] = from[key];
      this.autoavaliacao[key] = from[key];
    }
  }
}
