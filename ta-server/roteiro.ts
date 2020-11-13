import { BlocoDeQuestoes } from './bloco-de-questoes';

export class Roteiro {
    descricao: string = "";
    blocos: BlocoDeQuestoes[] = [];

    adicionarBlocoDeQuestoes(bloco: BlocoDeQuestoes): void {}
    removerBlocoDeQuestoes(bloco: BlocoDeQuestoes): void {}

    getDescricao(): string {
        return this.descricao;
    }

    getBlocos(): BlocoDeQuestoes[] {
        return this.blocos;
    }
}