import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AlunoService } from './aluno.service';
import { MetasComponent } from './metas.component';
import { RouterModule } from '@angular/router';

import { AlunosComponent } from './alunos.component';
import { AppComponent } from './app.component';


@NgModule({
  declarations: [
    AppComponent,
    MetasComponent,
    AlunosComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    RouterModule.forRoot([
      {
        path: 'metas',
        component: MetasComponent
      },
      {
        path: 'alunos',
        component: AlunosComponent
      }
    ])
  ],
  providers: [AlunoService],
  bootstrap: [AppComponent]
})
export class AppModule { }
