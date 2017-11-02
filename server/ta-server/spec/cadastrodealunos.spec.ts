import { CadastroDeAlunos } from '../cadastrodealunos';
import { Aluno } from '../../../gui/ta-gui/src/app/aluno';

describe("O cadastro de alunos", () => {
  var cadastro: CadastroDeAlunos;

  beforeEach(() => cadastro = new CadastroDeAlunos())

  it("é inicialmente vazio", () => {
    expect(cadastro.getAlunos().length).toBe(0);
  })

  it("cadastra alunos corretamente", () => {
    var aluno: Aluno = new Aluno();
    aluno.nome = "Mariana";
    aluno.cpf = "683";
    cadastro.criar(aluno);

    expect(cadastro.getAlunos().length).toBe(1);
    aluno = cadastro.getAlunos()[0];
    expect(aluno.nome).toBe("Mariana");
    expect(aluno.cpf).toBe("683");
    expect(aluno.email).toBe("");
    expect(aluno.metas.size).toBe(0);
  })

  it("não aceita alunos com CPF duplicado", () => {
    var aluno: Aluno = new Aluno();
    aluno.nome = "Mariana";
    aluno.cpf = "683";
    cadastro.criar(aluno);

    aluno = new Aluno();
    aluno.nome = "Pedro";
    aluno.cpf = "683";
    cadastro.criar(aluno);

    expect(cadastro.getAlunos().length).toBe(1);
  })

  it("cadastra metas corretamente", () => {
    var aluno: Aluno = new Aluno();
    aluno.nome = "Mariana";
    aluno.cpf = "683";
    aluno.addMetas("Conceitos Requisitos");
    aluno.addMetas("Testes");
    cadastro.criar(aluno);

    aluno = cadastro.getAlunos()[0];
    expect(aluno.nome).toBe("Mariana");
    expect(aluno.cpf).toBe("683");
    expect(aluno.email).toBe("");
    expect(aluno.metas.size).toBe(2);
    expect(aluno.getMetas()[0]).toBe("Conceitos Requisitos");
    expect(aluno.getMetas()[1]).toBe("Testes");

  })

  it("cadastra auto-avaliações corretamente", () => {
    var aluno: Aluno = new Aluno();
    aluno.nome = "Mariana";
    aluno.cpf = "683";
    aluno.addMetas("Conceitos Requisitos");
    aluno.addMetas("Testes");
    cadastro.criar(aluno);
    var map = new Map();
    map.set(aluno.getMetas()[0], "MA");
    map.set(aluno.getMetas()[1], "MPA");
    cadastro.copyAutoAvaliacoesFrom(map);

    aluno = cadastro.getAlunos()[0];
    expect(aluno.getAutoavaliacoes()[0]).toBe("MA");
    expect(aluno.getAutoavaliacoes()[1]).toBe("MPA");
  })


})
