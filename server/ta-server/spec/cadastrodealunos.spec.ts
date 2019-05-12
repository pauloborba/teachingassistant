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

  it('remove aluno corretamente', () => {
    var aluno: Aluno = new Aluno();
    aluno.nome = "Mariana";
    aluno.cpf = "683";
    cadastro.criar(aluno);

    cadastro.remover(aluno)

    expect(cadastro.getAlunos().length).toBe(0)
  })

  it('remoção não afeta outros alunos', () => {
    var aluno: Aluno = new Aluno();
    aluno.nome = "Mariana";
    aluno.cpf = "683";
    cadastro.criar(aluno);

    var al: Aluno = new Aluno();
    al.nome = "ÊÊÊÊÊÊÊÊÊÊÊÊ ÔÔÔÔÔÔÔÔÔÔ Vida de gadooo";
    al.cpf = "02";
    cadastro.criar(al)

    cadastro.remover(aluno)

    const alunos = cadastro.getAlunos()
    expect(alunos.length).toBe(1)
    expect(alunos[0].cpf).toEqual("02")
  })
})
