import { Component, OnInit } from '@angular/core';
import { Aluno } from '../../../common/aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  templateUrl: './alunos.component.html',
  styleUrls: ['./alunos.component.css']
})
export class AlunosComponent implements OnInit {

  aluno: Aluno = new Aluno();
  alunos: Aluno[] = [];
  cpfduplicado: boolean = false;
  githubduplicado: boolean = false;

  constructor(private alunoService: AlunoService) {}

   criarAluno(a: Aluno): void {
    this.alunoService.criar(a)
      .subscribe(
        ar => {
          if (ar instanceof Aluno) {
            this.alunos.push(ar);
            this.aluno = new Aluno();
          } else {
            this.cpfduplicado = ar.cpf;
            this.githubduplicado = ar.github;
          }
        },
      msg => { alert(msg.message); }
      );
      alert('Já executei o criar e o subscribe!');
    }

    deletarAluno(cpf: string): void {
      this.alunoService.deletar(cpf)
      .subscribe(
        () => {
          const alunoIndex = this.alunos.findIndex(aluno => aluno.cpf === cpf);

          this.alunos.splice(alunoIndex, 1);
        },
        msg => {alert(msg.message);}
      )
    }

    onMove(): void {
       this.cpfduplicado = false;
       this.githubduplicado = false;
    }

    ngOnInit(): void {
      this.alunoService.getAlunos()
      .subscribe(
        as => { this.alunos = as; },
        msg => { alert(msg.message); }
    );
  }
}
