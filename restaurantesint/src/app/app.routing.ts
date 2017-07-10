import { ModuleWithProviders } from '@angular/core';
// Importa o modulo de rotas do Angular 2
import { Routes, RouterModule } from '@angular/router';

// Importa seus componentes criados
import { RestaurantesComponent } from './restaurantes/list/list.component';
import { RestauranteFormComponent } from './restaurantes/form/form.component';
import { HomeComponent } from './home/home.component';
import { PratosComponent } from './pratos/list/list.component';
import { PratoFormComponent } from './pratos/form/form.component';


// Cria nossas Rotas
const appRoutes: Routes = [
  { path: '', pathMatch: 'full', component: HomeComponent },
  { path: 'restaurantes', component: RestaurantesComponent },
  { path: 'restaurantes/new', component: RestauranteFormComponent},
  { path: 'restaurantes/:id', component: RestauranteFormComponent},
  { path: 'restaurantes/:id/edit', component: RestauranteFormComponent},
  { path: 'home', component: HomeComponent},
  { path: 'pratos', component: PratosComponent},
  { path: 'pratos/new', component: PratoFormComponent},
  { path: 'pratos/:id', component: PratoFormComponent},
  { path: 'pratos/:id/edit', component: PratoFormComponent}
];

// Exporta a constante routing para ser importada no arquivo app.module.ts
export const routing: ModuleWithProviders = RouterModule.forRoot(appRoutes);
