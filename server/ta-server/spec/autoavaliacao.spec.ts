import { CadastroDeAlunos } from '../cadastrodealunos';
import { Aluno } from '../../../gui/ta-gui/src/app/aluno';

describe("A auto-avaliacao de alunos", () => {
    var cadastro: CadastroDeAlunos;

    beforeEach(() => cadastro = new CadastroDeAlunos())

    it("é inicialmente vazio", () => {
	expect(cadastro.getAlunos().length).toBe(0);
    })

    it("aceita avaliacoes corretamente", () => {
	var aluno: Aluno = new Aluno();
	aluno.nome = "Mariana";
	aluno.cpf = "683";
	aluno.metas = new Map<string,string>();
	aluno.metas["meta1"] = "MA";
	aluno.metas["meta2"] = "MANA";
	cadastro.criar(aluno);

	expect(cadastro.getAlunos().length).toBe(1);
	aluno = cadastro.getAlunos()[0];
	expect(aluno.nome).toBe("Mariana");
	expect(aluno.cpf).toBe("683");
	expect(aluno.email).toBe("");
	expect(Object.keys(aluno.metas).length).toBe(2);
	expect(aluno.metas["meta1"]).toBe("MA");
	expect(aluno.metas["meta2"]).toBe("MANA");
    })

    it ("rejeita avaliacoes pela metade", () => {
	var aluno: Aluno = new Aluno();
	aluno.nome = "Mariana";
	aluno.cpf = "683";
	aluno.metas = new Map<string,string>();
	aluno.metas["meta1"] = "MA";
	aluno.metas["meta2"] = "";
	cadastro.criar(aluno);

	expect(cadastro.getAlunos().length).toBe(1);
	aluno = cadastro.getAlunos()[0];
	expect(aluno.nome).toBe("Mariana");
	expect(aluno.cpf).toBe("683");
	expect(aluno.email).toBe("");
	expect(Object.keys(aluno.metas).length).toBe(0);
    })
})
