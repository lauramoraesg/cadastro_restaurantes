import { Injectable } from '@angular/core';

import { Http } from '@angular/http';

import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/catch';
import { Observable } from 'rxjs/Rx';

@Injectable()
export class RestauranteService {

  // URL da API
  private url: string = 'http://localhost:3000/restaurantes';

  constructor(private http: Http) { }

  // Pega os restaurantes na API
  getRestaurantes(textoBusca){
    return this.http.get(this.url + '?textoBusca=' + textoBusca)
      .map(res => res.json());
  }

  // Pega um restaurante na API
  getRestaurante(id){
    return this.http.get(this.url + '/' + id)
      .map(res => res.json());
  }

  // Adiciona um restaurante na API
  addRestaurante(restaurante){
    return this.http.post(this.url, restaurante)
      .map(res => res.json());
  }

  // Atualiza um restaurantes na API
  updateRestaurante(restaurantes){
    return this.http.put(this.url + '/' + restaurantes.id, restaurantes)
      .map(res => res.json());
  }

  // Apaga um restaurante no servidor
  deleteRestaurante(id){
    return this.http.delete(this.url + '/' + id)
      .map(res => res.json());
  }

}
