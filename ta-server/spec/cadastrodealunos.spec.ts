import { CadastroDeAlunos } from '../cadastrodealunos';
import { Aluno } from '../../common/aluno';

describe("O cadastro de alunos", () => {
  var cadastro: CadastroDeAlunos;

  function cadastrarAluno(nome:string, cpf:string) {
    var aluno: Aluno = new Aluno();
    aluno.nome = nome;
    aluno.cpf = cpf;
    cadastro.cadastrar(aluno);
  }

  function expectSoUmAluno() {
    expect(cadastro.getAlunos().length).toBe(1);
    var aluno = cadastro.getAlunos()[0];
    return aluno;
  }

  beforeEach(() => cadastro = new CadastroDeAlunos())

  it("é inicialmente vazio", () => {
    expect(cadastro.getAlunos().length).toBe(0);
  })

  it("cadastra alunos corretamente", () => {
    cadastrarAluno("Mariana","683");

    var aluno = expectSoUmAluno();
    expect(aluno.nome).toBe("Mariana");
    expect(aluno.cpf).toBe("683");
    expect(aluno.email).toBe("");
    expect(aluno.metas.size).toBe(0);
  })

  it("não aceita alunos com CPF duplicado", () => {
    cadastrarAluno("Mariana","683");
    cadastrarAluno("Pedro","683");

    var aluno = expectSoUmAluno();
    expect(aluno.nome).toBe("Mariana");
  })

  it("atualiza o aluno corretamente", () => {
    cadastrarAluno("Mariana", "683");

    var aluno = expectSoUmAluno();
    expect(aluno.nome).toEqual("Mariana");

    var updatedAluno = new Aluno();
    updatedAluno.copyFrom(aluno);
    updatedAluno.nome = "Adriellen";

    cadastro.atualizar(updatedAluno);

    aluno = expectSoUmAluno();
    expect(aluno).toEqual(updatedAluno);
  })

  it("remover aluno cadastrado", () => {
    cadastrarAluno("Mariana", "683");

    const aluno = expectSoUmAluno();
    expect(aluno.cpf).toBe("683");

    cadastro.remover(aluno.cpf);

    expect(cadastro.getAlunos().length).toBe(0);
  })

  it("falha ao remover aluno não cadastrado", () => {
    expect(cadastro.remover("123")).toThrow();
  })
})
