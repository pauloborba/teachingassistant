export class Aluno {
  nome: string;
  cpf: string;
  email: string;
  metas: Map<string,string>;

  constructor() {
    this.clean();
  }

  // Constrói um Aluno a partir de dados externos não confiáveis (o corpo de uma
  // requisição, por exemplo), retornando null quando os dados não descrevem um
  // aluno. Só a própria classe conhece a estrutura de um Aluno, então é ela quem
  // decide o que é um dado válido.
  static criarDeDadosExternos(dados: any): Aluno {
    if (!Aluno.saoDadosDeAluno(dados)) return null;

    var aluno: Aluno = new Aluno();
    aluno.nome = dados.nome;
    aluno.cpf = dados.cpf;
    if (typeof dados.email === "string") aluno.email = dados.email;
    if (dados.metas !== undefined && dados.metas !== null) aluno.copyMetasFrom(dados.metas);
    return aluno;
  }

  private static saoDadosDeAluno(dados: any): boolean {
    return dados !== null
        && dados !== undefined
        && typeof dados.nome === "string"
        && typeof dados.cpf === "string";
  }

  clean(): void {
    this.nome = "";
    this.cpf = "";
    this.email = "";
    this.metas = new Map<string,string>();
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
  }

  copyMetasFrom(from: Map<string,string>): void {
    this.metas = new Map<string,string>();
    for (let key in from) {
      this.metas[key] = from[key];
    }
  }
}
