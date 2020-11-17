import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ComparacaoDeDesempenhoComponent } from './comparacao-de-desempenho/comparacao-de-desempenho.component';
import { TurmasComponent } from './turmas/turmas.component';
import { MetasComponent } from './metas/metas.component';
import { AlunosComponent } from './alunos/alunos.component';
import { AutoavaliacaoComponent } from './autoavaliacao/autoavaliacao.component';
import { MonitoresComponent } from './monitores/monitores.component';
import { RoteirosComponent } from './roteiros/roteiros.component';

@NgModule({
  declarations: [
    AppComponent,
    ComparacaoDeDesempenhoComponent,
    TurmasComponent,
    MetasComponent,
    AlunosComponent,
    AutoavaliacaoComponent,
    MonitoresComponent,
    RoteirosComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
