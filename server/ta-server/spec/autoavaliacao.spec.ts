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
	aluno.selfmetas = new Map<string,string>();
	cadastro.criar(aluno);
	
	aluno.selfmetas["requisitos"] = "MA";
	aluno.selfmetas["gerDeConfiguracao"] = "MANA";
	cadastro.autoAvaliar(aluno);
	
	expect(cadastro.getAlunos().length).toBe(1);
	aluno = cadastro.getAlunos()[0];
	expect(aluno.nome).toBe("Mariana");
	expect(aluno.cpf).toBe("683");
	expect(aluno.email).toBe("");
	expect(Object.keys(aluno.selfmetas).length).toBe(2);
	expect(aluno.selfmetas["requisitos"]).toBe("MA");
	expect(aluno.selfmetas["gerDeConfiguracao"]).toBe("MANA");
    })

    it ("rejeita avaliacoes pela metade", () => {
	var aluno: Aluno = new Aluno();
	aluno.nome = "Mariana";
	aluno.cpf = "683";
	aluno.selfmetas = new Map<string,string>();
	aluno.metas = new Map<string,string>();
	cadastro.criar(aluno);

	aluno.selfmetas["requisitos"] = "MA";
	aluno.selfmetas["gerDeConfiguracao"] = "";

	cadastro.autoAvaliar(aluno);

	expect(cadastro.getAlunos().length).toBe(1);
	aluno = cadastro.getAlunos()[0];
	expect(aluno.nome).toBe("Mariana");
	expect(aluno.cpf).toBe("683");
	expect(aluno.email).toBe("");
	expect(Object.keys(aluno.selfmetas).length).toBe(0);
    })
})
