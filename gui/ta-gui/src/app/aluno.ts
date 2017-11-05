export class Aluno {
  nome: string;
  cpf: string;
  email: string;
  metas: Map<string,string>;
  metasp: Map<string,string>;

  constructor() {
    this.clean();
  }

  clean(): void {
    this.nome = "";
    this.cpf = "";
    this.email = "";
    this.metas = new Map<string,string>();
    this.metasp = new Map<string,string>();
  }

  clone(): Aluno {
    var aluno: Aluno = new Aluno();
    aluno.nome = this.nome;
    aluno.cpf = this.cpf;
    aluno.email = this.email;
    aluno.metas = this.cloneMetas();
    aluno.metasp = this.cloneMetasp();
    return aluno;
  }

  cloneMetas(): Map<string,string> {
    var metas: Map<string,string> = new Map<string,string>();
    for (let key in this.metas) {
      metas[key] = this.metas[key];
    }
    return metas;
  }
  
  cloneMetasp(): Map<string,string> {
    var metasp: Map<string,string> = new Map<string,string>();
    for (let key in this.metasp){
      metasp[key] = this.metasp[key];
    }
    return metasp;
  }
}
