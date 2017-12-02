export class Avaliacao {
  data: string;
  descricao: string;
  meta: string;
  

  constructor() {
    this.clean();
  }

  clean(): void {
    this.data = "";
    this.descricao = "";
    this.meta = "";
    
  }

  clone(): Avaliacao {
    var avaliacao: Avaliacao = new Avaliacao();    
    avaliacao.copyFrom(this);
    return avaliacao;
  }

  copyFrom(from: Avaliacao): void {
    this.data = from.data;
    this.descricao = from.descricao;
    this.meta = from.meta;    
  }

  
}


    
	
