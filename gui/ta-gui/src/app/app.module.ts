import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { ProfessorDashboardComponent } from './professor-dashboard.component';
import { ApiService } from './api.service';

@NgModule({
  declarations: [AppComponent, ProfessorDashboardComponent],
  imports: [BrowserModule, FormsModule, HttpModule],
  providers: [ApiService],
  bootstrap: [AppComponent]
})
export class AppModule {}
