import { Aluno } from '../common/aluno';

export class CadastroDeAlunos {
    alunos: Aluno[] = [];
 
     cadastrar(aluno: Aluno): Aluno {
      return null;
    }
 
     cpfNaoCadastrado(cpf: string): boolean {
       return false;
    }
 
     atualizar(aluno: Aluno): Aluno {
      return null;
    }
 
     getAlunos(): Aluno[] {
      return this.alunos;
    }

    deletar(email: string): Aluno {
        return null;
      }
 
 }