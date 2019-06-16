import { Metas } from '../metas';
import { Meta } from '../../../gui/ta-gui/src/app/meta';

describe("Controle de Metas", () => {
    var metasService: Metas;

    beforeEach(() => metasService = new Metas())

    it("é inicialmente vazio", () => {
        expect(metasService.getMetas().length).toBe(0);
    })

    it("adiciona meta corretamente", () => {
        var meta: Meta = new Meta();
        meta.nome = "Compreender e aplicar métodos de elicitação de requisitos";
        metasService.criar(meta);

        expect(metasService.getMetas().length).toBe(1);
        meta = metasService.getMetas()[0];
        expect(meta.nome).toBe("Compreender e aplicar métodos de elicitação de requisitos");
    })

    it("não aceita metas com nome duplicado", () => {
        var meta: Meta = new Meta();
        meta.nome = "Compreender e aplicar métodos de elicitação de requisitos";
        metasService.criar(meta);

        meta = new Meta();
        meta.nome = "Compreender e aplicar métodos de elicitação de requisitos";
        metasService.criar(meta);

        expect(metasService.getMetas().length).toBe(1);
    })

    it("atualiza meta corretamente", () => {
        var meta: Meta = new Meta();
        meta.nome = "Compreender e aplicar métodos de elicitação de requisitos";
        metasService.criar(meta);

        expect(metasService.getMetas().length).toBe(1);
        meta = metasService.getMetas()[0];
        expect(meta.nome).toBe("Compreender e aplicar métodos de elicitação de requisitos");

        metasService.atualizar(meta, "Compreender e aplicar métodos de controle de versão");

        expect(metasService.getMetas().length).toBe(1);
        meta = metasService.getMetas()[0];
        expect(meta.nome).toBe("Compreender e aplicar métodos de controle de versão");
    })

    it("remove meta corretamente", () => {
        var meta: Meta = new Meta();
        meta.nome = "Compreender e aplicar métodos de elicitação de requisitos";
        metasService.criar(meta);

        expect(metasService.getMetas().length).toBe(1);
        meta = metasService.getMetas()[0];
        expect(meta.nome).toBe("Compreender e aplicar métodos de elicitação de requisitos");

        metasService.remover(meta);

        expect(metasService.getMetas().length).toBe(0);
    })

})
