import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterModule }   from '@angular/router';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { MetasComponent } from './metas.component';
import { AlunosComponent } from './alunos.component';
import { AlunoService } from './aluno.service';
import { SelfMetasComponent } from './selfmetas.component';
import { DiscrepanciasComponent } from './discrepancias.component';

@NgModule({
    declarations: [
	AppComponent,
	MetasComponent,
	AlunosComponent,
	SelfMetasComponent,
	DiscrepanciasComponent
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
		path: 'selfmetas',
		component: SelfMetasComponent
	    },
	    {
		path: 'discrepancias',
		component: DiscrepanciasComponent
	    }
	])
    ],
    providers: [AlunoService],
    bootstrap: [AppComponent]
})
export class AppModule { }
