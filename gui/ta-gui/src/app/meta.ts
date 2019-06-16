export class Meta {
    nome: string;

    constructor() {
        this.clean();
    }

    clean(): void {
        this.nome = "";
    }

    clone(): Meta {
        var meta: Meta = new Meta();
        meta.nome = this.nome;
        return meta;
    }
}
