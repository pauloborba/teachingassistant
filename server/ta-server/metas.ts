import { Meta } from '../../gui/ta-gui/src/app/meta';

export class Metas {
    metas: Meta[] = [];

    criar(meta: Meta): Meta {
        var result = null;
        if (!this.metas.find(m => m.nome == meta.nome) && meta.nome != "") {
            result = new Meta();
            result.nome = meta.nome;
            this.metas.push(result);
        }
        return result;
    }

    atualizar(meta: Meta, nome: string): Meta {
        var result: Meta = this.metas.find(m => m.nome == meta.nome);
        result.nome = nome;
        return result;
    }

    remover(meta: Meta) : Meta {
        const index: number = this.metas.findIndex(m => m.nome == meta.nome);
        if (index !== -1) {
            this.metas.splice(index, 1);
        }
        
        return meta;
    }

    getMetas() : Meta[] {
        return this.metas
    }
}
