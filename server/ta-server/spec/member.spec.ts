import { CadastroDeAlunos } from '../cadastrodealunos';
import { Aluno } from '../../../gui/ta-gui/src/app/aluno';

describe("O cadastro de Metas", () => {

var cadastro: CadastroDeAlunos;

  beforeAll(() => cadastro = new CadastroDeAlunos())

  it("cadastra Metas corretamente", () => {
    var aluno: Aluno = new Aluno();
    aluno.nome = "Mariana";
    aluno.metas.set('Requisitos','MA');
    cadastro.criar(aluno);
    expect(aluno.nome).toBe("Mariana");
    expect(aluno.metas.size).toBe(1);
  })

  it("nao cadastra Metas repetidas", () => {
    var aluno: Aluno = new Aluno();
    aluno.nome = "Mariana";
    aluno.metas.set('Requisitos','MA');
    cadastro.criar(aluno);
    expect(aluno.nome).toBe("Mariana");
    expect(aluno.metas.size).toBe(1);
  })
})