export class Aluno {
  nome: string;
  cpf: string;
  email: string;
  metas: Map<string,string>;
  media: string;
  mediaTitle: string;
  finalExam: string;
  finalAverage: number;

  constructor() {
    this.clean();
  }

  clean(): void {
    this.nome = "";
    this.cpf = "";
    this.email = "";
    this.metas = new Map<string,string>();
    this.media = "";
    this.mediaTitle = "";
    this.finalExam = "";
    this.finalAverage = 0;
  }

  clone(): Aluno {
    var aluno: Aluno = new Aluno();
    aluno.metas = new Map<string,string>();
    aluno.copyFrom(this);
    return aluno;
  }

  copyFrom(from: Aluno): void {
    this.nome = from.nome;
    this.cpf = from.cpf;
    this.email = from.email;
    this.copyMetasFrom(from.metas);
    this.media = from.media;
    this.mediaTitle = from.mediaTitle;
    this.finalExam = from.finalExam;
    this.finalAverage = from.finalAverage;
  }

  copyMetasFrom(from: Map<string,string>): void {
    this.metas = new Map<string,string>();
    for (let key in from) {
      this.metas[key] = from[key];
    }
  }
}
