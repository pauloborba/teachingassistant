import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ComparacaoDeDesempenhoComponent } from './comparacao-de-desempenho/comparacao-de-desempenho.component';
import { TurmasComponent } from './turmas/turmas.component';

@NgModule({
  declarations: [
    AppComponent,
    ComparacaoDeDesempenhoComponent,
    TurmasComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
