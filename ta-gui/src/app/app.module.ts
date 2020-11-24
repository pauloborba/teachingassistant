import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ComparacaoDeDesempenhoComponent } from './comparacao-de-desempenho/comparacao-de-desempenho.component';
import { TurmasComponent } from './turmas/turmas.component';
import { MetasComponent } from './metas/metas.component';
import { AlunosComponent } from './alunos/alunos.component';
import { AutoavaliacaoComponent } from './autoavaliacao/autoavaliacao.component';
import { MonitoresComponent } from './monitores/monitores.component';
import { RoteirosComponent } from './roteiros/roteiros.component';
import { AdicionarTurmaComponent } from './turmas/adicionar-turma/adicionar-turma.component';
import { EditarTurmaComponent } from './turmas/editar-turma/editar-turma.component';

@NgModule({
  declarations: [
    AppComponent,
    ComparacaoDeDesempenhoComponent,
    TurmasComponent,
    MetasComponent,
    AlunosComponent,
    AutoavaliacaoComponent,
    MonitoresComponent,
    RoteirosComponent,
    AdicionarTurmaComponent,
    EditarTurmaComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    RouterModule.forRoot([{

      path: 'metas',
      component: MetasComponent
    },
    {
      path:'alunos',
      component: AlunosComponent
    },
    {
      path: 'auto-avaliacao',
      component: AutoavaliacaoComponent
    },
    {
      path: 'turmas',
      component: TurmasComponent
    },
    {
      path: 'roteiros',
      component: RoteirosComponent
    },
    {
      path: 'adicionar-turma',
      component: AdicionarTurmaComponent
    },
    {
      path: 'editar-turma',
      component: EditarTurmaComponent
    },
    
  ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
