import { Injectable } from '@angular/core';

import { Http } from '@angular/http';

import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/catch';
import { Observable } from 'rxjs/Rx';

@Injectable()
export class ClientService {

    // TODO: criar outro arquivo para a parte de CEP 
    private url_cep: string = 'http://localhost:3000/ceps';
    private url: string = 'http://localhost:3000/clients';

    constructor(private http: Http) { }

    getClientAddress(cep){
    return this.http.get(this.url_cep + '/' + cep)
      .map(res => res.json());
    }

    getClients(){
        return this.http.get(this.url)
            .map(res => res.json());
    }

    getClient(id){
      return this.http.get(this.url + '/' + id)
          .map(res => res.json());
    }

    addClient(client){
      return this.http.post(this.url, client)
          .map(res => res.json());
    }

    updateClient(clients){
      return this.http.put(this.url + '/' + clients.id, clients)
          .map(res => res.json());
    }

    // Apaga um restaurante no servidor
    deleteClient(id){
        return this.http.delete(this.url + '/' + id)
            .map(res => res.json());
    }

}