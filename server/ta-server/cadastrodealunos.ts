import { Aluno } from '../../gui/ta-gui/src/app/aluno';
import { Avaliacao } from '../../gui/ta-gui/src/app/avaliacao';

export class CadastroDeAlunos {
  alunos: Aluno[] = [];
  avaliacoes: Avaliacao[] = [];

  criar(aluno: Aluno): Aluno {
    var result = null;
    if (this.cpfNaoCadastrado(aluno.cpf)) {
      result = new Aluno();
      result.copyFrom(aluno);
      this.alunos.push(result);
    }
    return result;
  }

  criarAval(avaliacao: Avaliacao): Avaliacao {
    var result = null;
    if (this.avaliacaoNaoCadastrada(avaliacao)) {
      result = new Avaliacao();
      result.copyFrom(avaliacao);
      this.avaliacoes.push(result);
    }
    return result;
  }

  cpfNaoCadastrado(cpf: string): boolean {
     return !this.alunos.find(a => a.cpf == cpf);
  }

  avaliacaoNaoCadastrada(aval: Avaliacao): boolean {
     return !((this.avaliacoes.find(a => a.data == aval.data))&&(this.avaliacoes.find(a => a.descricao == aval.descricao))
      &&(this.avaliacoes.find(a => a.meta == aval.meta)));
  }

  atualizar(aluno: Aluno): Aluno {
    var result: Aluno = this.alunos.find(a => a.cpf == aluno.cpf);
    if (result) result.copyFrom(aluno);
    return result;
  }

  getAlunos(): Aluno[] {
    return this.alunos;
  }
  atualizarAval(avaliacao: Avaliacao): Avaliacao {
    var result: Avaliacao = this.avaliacoes.find(a => a.data == avaliacao.data);    
    result.copyFrom(avaliacao);
    return result;
  }

  getAvaliacoes(): Avaliacao[] {
    return this.avaliacoes;
  }
}
