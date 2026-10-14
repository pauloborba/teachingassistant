// Value object: um conceito não tem identidade própria, é imutável, e dois
// conceitos com o mesmo valor são indistinguíveis. Só a própria classe conhece
// quais são os valores aceitos.
export class Conceito {
  private static readonly ACEITOS: string[] = ["MA", "MPA", "MANA"];

  private constructor(private readonly valor: string) {}

  static aceitos(): string[] {
    return Conceito.ACEITOS.slice();
  }

  static ehAceito(valor: string): boolean {
    return typeof valor === "string" && Conceito.ACEITOS.indexOf(valor) >= 0;
  }

  // Factory: devolve null quando o texto não descreve um conceito aceito.
  static de(valor: string): Conceito {
    return Conceito.ehAceito(valor) ? new Conceito(valor) : null;
  }

  toString(): string {
    return this.valor;
  }

  igual(outro: Conceito): boolean {
    return outro != null && this.valor === outro.valor;
  }
}
