// Value object: o resultado de uma operação de negócio. Carrega o motivo da
// falha, para que o cliente possa informar ao usuário exatamente o que houve,
// em vez de só saber que a operação não funcionou.
export class Resultado {
  private constructor(private readonly erro: string) {}

  static sucesso(): Resultado {
    return new Resultado(null);
  }

  static falha(erro: string): Resultado {
    return new Resultado(erro);
  }

  sucedeu(): boolean {
    return this.erro === null;
  }

  getErro(): string {
    return this.erro;
  }
}
