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
                  if (ar) {
                    this.alunos.push(ar);
                    this.aluno = new Aluno();
                  } else {
                    let duplicationNumber = this.hasDuplication(a);
                    if(duplicationNumber == 1){
                      this.cpfduplicado = true;
                    }else if(duplicationNumber == 2){
                      this.githubduplicado = true;
                    }else if(duplicationNumber == 3){
                      this.cpfduplicado = true;
                      this.githubduplicado = true;
                    }
                  }
                },
                msg => { alert(msg.message); }
              );
       //alert("Já executei o criar e o subscribe!")      
    } 

    hasDuplication(a : Aluno){
      let ans = 0;
      for(let i of this.alunos){
        if(i.cpf == a.cpf){
          ans++;
        }
        if(i.loginGithub == a.loginGithub){
          ans += 2;
        }
      }
      return ans;
    }

    removerAluno(aluno: Aluno): void{
      this.alunoService.remover(aluno).subscribe(
        ar =>{
          if(ar){
            this.removeFromArray(aluno);
          }
        },
        msg => { alert(msg.message);}
      );
    }

    removeFromArray(aluno: Aluno){
      
      for(let x = 0; x < this.alunos.length; x++){
        if(this.alunos[x].cpf == aluno.cpf){
          this.alunos.splice(x, 1);
          break;
        }
      }
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