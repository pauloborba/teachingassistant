// Entity: uma turma tem identidade própria (o seu nome), e continua sendo a
// mesma turma mesmo quando as suas metas ou o estado da auto-avaliação mudam.
export class Turma {
  private metas: string[] = [];
  private autoavaliacaoAberta: boolean = true;

  constructor(private readonly nome: string, metas: string[] = []) {
    this.metas = metas.slice();
  }

  getNome(): string {
    return this.nome;
  }

  getMetas(): string[] {
    return this.metas.slice();
  }

  possuiMeta(meta: string): boolean {
    return this.metas.indexOf(meta) >= 0;
  }

  estaComAutoavaliacaoAberta(): boolean {
    return this.autoavaliacaoAberta;
  }

  abrirAutoavaliacao(): void {
    this.autoavaliacaoAberta = true;
  }

  fecharAutoavaliacao(): void {
    this.autoavaliacaoAberta = false;
  }
}
