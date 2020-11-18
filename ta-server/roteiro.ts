import { BlocoDeQuestoes } from './blocodequestoes';

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