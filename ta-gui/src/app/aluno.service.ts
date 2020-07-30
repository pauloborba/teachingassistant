import {Aluno} from './aluno';

export class AlunoService{
  alunos: Aluno[] = [];

  gravar(aluno: Aluno): Aluno{
    const alunoComCPF = this.alunos.find(a => aluno.cpf === a.cpf);
    if(alunoComCPF){
      return null;
    }

    this.alunos.push(aluno);
    return aluno;
  }
}
