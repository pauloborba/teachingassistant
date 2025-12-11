import { store } from '../../data/store';
import { Professor, Monitor, Aluno } from '../../models';

export type TipoUsuario = 'professor' | 'monitor' | 'aluno';

export interface LoginRequest {
  tipo: TipoUsuario;
  identificador: string;
  senha: string;
}

export class AuthModule {
  login(dados: LoginRequest): { tipo: TipoUsuario; usuario: any } {
    if (!dados.identificador || !dados.senha) {
      throw new Error('Informe usuário e senha.');
    }
    switch (dados.tipo) {
      case 'professor':
        return { tipo: 'professor', usuario: this.validarProfessor(dados.identificador, dados.senha) };
      case 'monitor':
        return { tipo: 'monitor', usuario: this.validarMonitor(dados.identificador, dados.senha) };
      case 'aluno':
        return { tipo: 'aluno', usuario: this.validarAluno(dados.identificador, dados.senha) };
      default:
        throw new Error('Tipo de usuário inválido.');
    }
  }

  private validarProfessor(email: string, senha: string): Professor {
    const professor = store.professors.find(p => p.email === email);
    if (!professor || professor.senha !== senha) {
      throw new Error('Professor não encontrado ou senha inválida.');
    }
    return { ...professor, senha: undefined };
  }

  private validarMonitor(matricula: string, senha: string): Monitor {
    const monitor = store.monitores.find(m => m.matricula === matricula);
    if (!monitor || monitor.senha !== senha) {
      throw new Error('Monitor não encontrado ou senha inválida.');
    }
    return { ...monitor, senha: undefined };
  }

  private validarAluno(matricula: string, senha: string): Aluno {
    const aluno = store.alunos.find(a => a.matricula === matricula);
    if (!aluno || aluno.senha !== senha) {
      throw new Error('Aluno não encontrado ou senha inválida.');
    }
    return { ...aluno, senha: undefined };
  }
}
