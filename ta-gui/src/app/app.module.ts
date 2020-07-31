import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import {AlunosComponent} from './alunos.component';
import {MetasComponent} from './metas.component'

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AlunoService } from './aluno.service';
import { RouterModule } from '@angular/router';

@NgModule({
  declarations: [
    AppComponent,
    AlunosComponent,
    MetasComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
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
