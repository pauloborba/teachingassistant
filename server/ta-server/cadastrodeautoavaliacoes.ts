import { Autoavaliacao } from '../../gui/ta-gui/src/app/autoavaliacao';
import { Conceito } from '../../gui/ta-gui/src/app/conceito';
import { Resultado } from '../../gui/ta-gui/src/app/resultado';
import { Turma } from '../../gui/ta-gui/src/app/turma';

// Repositório das auto-avaliações de uma turma, e ponto de entrada das
// operações que o aluno realiza sobre a sua própria auto-avaliação.
// A turma é injetada, e não criada aqui, para que o cadastro possa ser usado
// com qualquer turma e testado sem depender de uma turma específica.
export class CadastroDeAutoavaliacoes {
  private autoavaliacoes: { [cpf: string]: Autoavaliacao } = {};

  constructor(private readonly turma: Turma) {}

  registrarConceito(cpf: string, meta: string, conceito: string): Resultado {
    var impedimento: Resultado = this.impedimentoParaAlterar(meta);
    if (!impedimento.sucedeu()) return impedimento;

    var conceitoRegistrado: Conceito = Conceito.de(conceito);
    if (conceitoRegistrado === null) {
      return Resultado.falha('"' + conceito + '" não é um conceito válido; os conceitos aceitos são '
                             + Conceito.aceitos().join(", "));
    }

    this.autoavaliacaoDe(cpf).registrar(meta, conceitoRegistrado);
    return Resultado.sucesso();
  }

  removerConceito(cpf: string, meta: string): Resultado {
    var impedimento: Resultado = this.impedimentoParaAlterar(meta);
    if (!impedimento.sucedeu()) return impedimento;

    if (!this.autoavaliacaoDe(cpf).remover(meta)) {
      return Resultado.falha('A meta "' + meta + '" não tem conceito registrado');
    }
    return Resultado.sucesso();
  }

  // Condições que valem para qualquer alteração da auto-avaliação, reunidas em
  // um único lugar para que registrar e remover não as repitam.
  private impedimentoParaAlterar(meta: string): Resultado {
    if (!this.turma.estaComAutoavaliacaoAberta()) {
      return Resultado.falha('A auto-avaliação de "' + this.turma.getNome() + '" está encerrada');
    }
    if (!this.turma.possuiMeta(meta)) {
      return Resultado.falha('A meta "' + meta + '" não pertence a "' + this.turma.getNome() + '"');
    }
    return Resultado.sucesso();
  }

  // Devolve a auto-avaliação do aluno na turma, criando uma vazia na primeira
  // vez que o aluno a acessa, para que o cliente nunca precise tratar null.
  autoavaliacaoDe(cpf: string): Autoavaliacao {
    if (!Object.prototype.hasOwnProperty.call(this.autoavaliacoes, cpf)) {
      this.autoavaliacoes[cpf] = new Autoavaliacao();
    }
    return this.autoavaliacoes[cpf];
  }

  getTurma(): Turma {
    return this.turma;
  }
}
