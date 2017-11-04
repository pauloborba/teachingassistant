import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  templateUrl: './avaliacao.component.html',
  styleUrls: ['./avaliacao.component.css']
})
export class AvaliacaoComponent implements OnInit {
   constructor(private alunoService: AlunoService) {}

   aluno: Aluno = new Aluno();
   alunos: Aluno[];
   cpfexiste: boolean = false;
   completa: boolean = true;

   enviarAval(aluno: Aluno) {
       this.completa = true;    
       this.verificaCompletude(aluno);
       if (this.completa) {
        this.alunoService.atualizar(aluno)
        .catch(erro => alert(erro));
       }
   }

   localizarAluno(nome: string, cpf: string) {
    for (let a of this.alunos) {
        if (a.nome === nome && a.cpf === cpf) {
            this.aluno = a;
            return this.cpfexiste = true;
        }
    }
   }

   verificaCompletude(aluno: Aluno): void {
    this.completa = true;
    const cn = document.getElementById('tabela').children[0].children;
    console.log(cn);
    for (let i = 1; i < cn.length - 1; i += 1) {
        console.log(cn[i].id.substring(2));
        if (aluno.avaliacao[cn[i].id.substring(2)]) {
            document.getElementById(cn[i].id.substring(2)).style.backgroundColor = 'white';
        } else {
            document.getElementById(cn[i].id.substring(2)).style.backgroundColor = 'red';
            this.completa = false;
        }
    }

    // for (let key in aluno.metas) {
    //     if (aluno.avaliacao[key]) {
    //         document.getElementById(key).style.backgroundColor = 'white';
    //     } else {
    //         document.getElementById(key).style.backgroundColor = 'red';
    //         this.completa = false;
    //     }
    // }

    //    if (Object.keys(aluno.avaliacao).length === Object.keys(aluno.metas).length) {
    //         for (const key in aluno.metas) {
    //             this.nullNorEmpty(aluno, key);
    //         }
    //         return this.completa = true;
    //    }
   }

//    nullNorEmpty(aluno: Aluno, key: string): boolean {
//     if (aluno.avaliacao[key] === '' || aluno.avaliacao[key] == null) {
//         document.getElementById(key).style.backgroundColor = 'red';
//         return this.completa = false;
//     }
//    }


   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));
   }


}
