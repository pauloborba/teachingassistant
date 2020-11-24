import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {AdicionarTurmaComponent} from './adicionar-turma/adicionar-turma.component'

const routes: Routes = [
    {path:'AdicionarTurma', component: AdicionarTurmaComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
