import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterModule }   from '@angular/router';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { MetasComponent } from './metas.component';
import { AlunosComponent } from './alunos.component';
import { AutoavaliacaoComponent } from './autoavaliacao.component';
import { AlunoService } from './aluno.service';

@NgModule({
  declarations: [
    AppComponent,
    MetasComponent,
    AlunosComponent,
    AutoavaliacaoComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule, 
    RouterModule.forRoot([
      {
        path: 'metas',
        component: MetasComponent
      },
      {
        path: 'alunos',
        component: AlunosComponent
      },
      {
        path: 'autoavaliacao',
        component: AutoavaliacaoComponent
      }
    ])
  ],
  providers: [AlunoService],
  bootstrap: [AppComponent]
})
export class AppModule { }
