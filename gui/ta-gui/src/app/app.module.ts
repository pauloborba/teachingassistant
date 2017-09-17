import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { RouterModule }   from '@angular/router';

import { AppComponent } from './app.component';
import { AlunoService } from './aluno.service';
import { MetasComponent } from './metas.component';
import { AlunosComponent } from './alunos.component';

@NgModule({
  imports:      [ BrowserModule, 
                  FormsModule,
                  RouterModule.forRoot([{
                    path: 'metas',
                    component: MetasComponent
                  },
                  {
                    path: 'alunos',
                    component: AlunosComponent
                  }])],
  declarations: [ AppComponent, MetasComponent, AlunosComponent ],
  providers:    [ AlunoService ],
  bootstrap:    [ AppComponent ]
})
export class AppModule { }