import { CadastroDeAutoavaliacoes } from '../cadastrodeautoavaliacoes';
import { Turma } from '../../../gui/ta-gui/src/app/turma';

// Dados das metas usados pelos cenários da feature student-grade-management.
var ESPECIFICAR: string = "Specify requirements with quality";
var TESTES: string = "Write quality tests";
var CPF_BRUNO: string = "683";

describe("O cadastro de auto-avaliações", () => {
  var turma: Turma;
  var cadastro: CadastroDeAutoavaliacoes;

  beforeEach(() => {
    turma = new Turma("ESS 2025.1", [ESPECIFICAR, TESTES]);
    cadastro = new CadastroDeAutoavaliacoes(turma);
  })

  it("começa sem nenhum conceito registrado para o aluno", () => {
    expect(cadastro.autoavaliacaoDe(CPF_BRUNO).estaVazia()).toBe(true);
  })

  it("registra o conceito de uma meta que ainda não tinha conceito", () => {
    var resultado = cadastro.registrarConceito(CPF_BRUNO, ESPECIFICAR, "MPA");

    expect(resultado.sucedeu()).toBe(true);
    expect(cadastro.autoavaliacaoDe(CPF_BRUNO).conceitoDe(ESPECIFICAR).toString()).toBe("MPA");
    expect(cadastro.autoavaliacaoDe(CPF_BRUNO).possuiConceitoPara(TESTES)).toBe(false);
  })

  it("atualiza o conceito de uma meta que já tinha conceito", () => {
    cadastro.registrarConceito(CPF_BRUNO, TESTES, "MANA");

    var resultado = cadastro.registrarConceito(CPF_BRUNO, TESTES, "MA");

    expect(resultado.sucedeu()).toBe(true);
    expect(cadastro.autoavaliacaoDe(CPF_BRUNO).conceitoDe(TESTES).toString()).toBe("MA");
    expect(cadastro.autoavaliacaoDe(CPF_BRUNO).metasAvaliadas().length).toBe(1);
  })

  it("remove o conceito de uma meta, preservando o das demais", () => {
    cadastro.registrarConceito(CPF_BRUNO, ESPECIFICAR, "MPA");
    cadastro.registrarConceito(CPF_BRUNO, TESTES, "MA");

    var resultado = cadastro.removerConceito(CPF_BRUNO, ESPECIFICAR);

    expect(resultado.sucedeu()).toBe(true);
    expect(cadastro.autoavaliacaoDe(CPF_BRUNO).possuiConceitoPara(ESPECIFICAR)).toBe(false);
    expect(cadastro.autoavaliacaoDe(CPF_BRUNO).conceitoDe(TESTES).toString()).toBe("MA");
  })

  it("não remove o conceito de uma meta que não tem conceito registrado", () => {
    var resultado = cadastro.removerConceito(CPF_BRUNO, TESTES);

    expect(resultado.sucedeu()).toBe(false);
    expect(resultado.getErro()).toContain(TESTES);
  })

  it("não registra um conceito que a turma não aceita", () => {
    var resultado = cadastro.registrarConceito(CPF_BRUNO, TESTES, "XYZ");

    expect(resultado.sucedeu()).toBe(false);
    expect(resultado.getErro()).toContain("XYZ");
    expect(resultado.getErro()).toContain("MA, MPA, MANA");
    expect(cadastro.autoavaliacaoDe(CPF_BRUNO).possuiConceitoPara(TESTES)).toBe(false);
  })

  it("não registra conceito para uma meta que não pertence à turma", () => {
    var outraMeta = "Understand configuration management concepts";

    var resultado = cadastro.registrarConceito(CPF_BRUNO, outraMeta, "MA");

    expect(resultado.sucedeu()).toBe(false);
    expect(resultado.getErro()).toContain(outraMeta);
    expect(cadastro.autoavaliacaoDe(CPF_BRUNO).estaVazia()).toBe(true);
  })

  it("não altera a auto-avaliação depois que a turma a encerra", () => {
    cadastro.registrarConceito(CPF_BRUNO, ESPECIFICAR, "MPA");
    turma.fecharAutoavaliacao();

    var resultado = cadastro.registrarConceito(CPF_BRUNO, ESPECIFICAR, "MA");

    expect(resultado.sucedeu()).toBe(false);
    expect(resultado.getErro()).toContain("ESS 2025.1");
    expect(cadastro.autoavaliacaoDe(CPF_BRUNO).conceitoDe(ESPECIFICAR).toString()).toBe("MPA");
  })

  it("não remove conceito depois que a turma encerra a auto-avaliação", () => {
    cadastro.registrarConceito(CPF_BRUNO, ESPECIFICAR, "MPA");
    turma.fecharAutoavaliacao();

    var resultado = cadastro.removerConceito(CPF_BRUNO, ESPECIFICAR);

    expect(resultado.sucedeu()).toBe(false);
    expect(cadastro.autoavaliacaoDe(CPF_BRUNO).conceitoDe(ESPECIFICAR).toString()).toBe("MPA");
  })

  it("mantém separadas as auto-avaliações de alunos diferentes", () => {
    cadastro.registrarConceito(CPF_BRUNO, ESPECIFICAR, "MA");
    cadastro.registrarConceito("962", ESPECIFICAR, "MANA");

    expect(cadastro.autoavaliacaoDe(CPF_BRUNO).conceitoDe(ESPECIFICAR).toString()).toBe("MA");
    expect(cadastro.autoavaliacaoDe("962").conceitoDe(ESPECIFICAR).toString()).toBe("MANA");
  })

})
