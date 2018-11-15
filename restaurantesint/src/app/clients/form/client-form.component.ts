import { Component, OnInit } from '@angular/core';
import { ClientService } from '../shared/client.service';
import { Client } from '../shared/client';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-client-form',
  templateUrl: './client-form.component.html',
  styleUrls: ['./client-form.component.css']
})
export class ClientFormComponent implements OnInit {

    // variável para ver se é  edição ou criação de cliente
    title: string;
    // Pega Model e coloca na variável prato
    client: Client = new Client();

    constructor(
      private clientService: ClientService,
      private router: Router,
      private route: ActivatedRoute
  ) { }

    // Método roda enquanto a página é carregada para preencher o cliente caso seja edição
    ngOnInit() {

        var id = this.route.params.subscribe(params => {
            var id = params['id'];

            this.title = id ? 'Client edition ' : 'New client';

            if (!id)
                return;

            this.clientService.getClient(id)
                .subscribe(client => {
                    this.client = client,
                    response => {}
                });
        });
    }

    getAddress(){
        this.clientService.getClientAddress(this.client.cep)
            .subscribe(address => {
                this.client.street = address.logradouro;
                this.client.complement = address.complemento;
                this.client.neighborhood = address.bairro;
                this.client.city = address.localidade;
                this.client.province = address.uf;
            })
    }

    // Método chamado no form para criar/editar cliente
    save() {
        var result;

        if (this.client.id){
            result = this.clientService.updateClient(this.client);
        } else {
            result = this.clientService.addClient(this.client);
        }

        result.subscribe(data => this.router.navigate(['/clients']));
    }

}