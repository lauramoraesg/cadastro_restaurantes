// Dependencias do Angular 2
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './main/app.component';

// Adicionamos o arquivo routing
import { routing } from './app.routing';

import { RestaurantesComponent } from './restaurantes/list/list.component';
import { RestauranteFormComponent } from './restaurantes/form/form.component';
import { RestauranteService } from './restaurantes/shared/restaurante.service';
import { HomeComponent } from './home/home.component';
import { PratosComponent } from './pratos/list/list.component';
import { PratoFormComponent } from './pratos/form/form.component';
import { PratoService } from './pratos/shared/prato.service';

// Adicionamos em imports a contant routing e tambem nosso service em Providers
@NgModule({
  declarations: [
    AppComponent,
    RestaurantesComponent,
    RestauranteFormComponent,
    HomeComponent,
    PratosComponent,
    PratoFormComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    routing
  ],
  providers: [RestauranteService, PratoService],
  bootstrap: [AppComponent],
})
export class AppModule { }
