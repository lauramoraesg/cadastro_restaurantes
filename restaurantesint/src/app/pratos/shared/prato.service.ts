import { Injectable } from '@angular/core';
import { Http } from '@angular/http';

import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/catch';
import { Observable } from 'rxjs/Rx';

@Injectable()
export class PratoService {

  // URL da API
  private url: string = 'http://localhost:3000/pratos';

  constructor(private http: Http) { }

  // Pega os pratos na API
  getPratos(){
    return this.http.get(this.url)
      .map(res => res.json());
  }

  // Pega um prato na API
  getPrato(id){
    return this.http.get(this.url + '/' + id)
      .map(res => res.json());
  }

  // Adiciona um prato na API
  addPrato(prato){
    return this.http.post(this.url, {prato: prato})
      .map(res => res.json());
  }

  // Atualiza um prato na API
  updatePrato(prato){
    return this.http.put(this.url + '/' + prato.id, prato)
      .map(res => res.json());
  }

  // Apaga um prato no servidor
  deletePrato(id){
    return this.http.delete(this.url + '/' + id)
      .map(res => res.json());
  }

}
