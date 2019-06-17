import { Component, OnInit } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

import { Meta } from './meta';
import { MetaService } from './metas.service';

@Component({
  selector: 'metas',
  templateUrl: './metas.component.html',
  styleUrls: ['./metas.component.css']
})
export class MetasComponent implements OnInit {
   constructor(private alunoService: AlunoService, private metaService: MetaService) {}

   alunos: Aluno[];
   metas: Meta[];
   novaMeta: Meta = new Meta();

   atualizarAluno(aluno: Aluno): void {
      this.alunoService.atualizar(aluno)
         .catch(erro => alert(erro));
   }

   ngOnInit(): void {
      this.alunoService.getAlunos()
         .then(alunos => this.alunos = alunos)
         .catch(erro => alert(erro));

      this.metaService.getMetas()
      .then(metas => this.metas = metas)
      .catch(erro => alert(erro));
   }

   criarMeta() : void {
      this.metaService.criar(this.novaMeta).then(meta => {
         this.metas.push(meta);
         this.novaMeta = new Meta();
         console.log(this.alunos[0].metas);
      });      
   }

   atualizarMeta(meta : Meta) : void {
      var antigoNome : string = meta.nome;
      this.metaService.atualizar(meta, this.novaMeta.nome).then(meta => {
         const index: number = this.metas.findIndex(m => m.nome == meta.nome);
         this.alunos.forEach(aluno => {
            aluno.metas[this.novaMeta.nome] = aluno.metas[antigoNome];
            aluno.metas.delete(antigoNome);
            this.atualizarAluno(aluno);
         });
         this.novaMeta = new Meta();
      });
   }

   removerMeta(meta : Meta) : void {
      this.metaService.remover(meta).then( meta => {
         const index: number = this.metas.findIndex(m => m.nome == meta.nome);
         if (index !== -1) {
            this.metas.splice(index, 1);
         }
      });
   }

}
