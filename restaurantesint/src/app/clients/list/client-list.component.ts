import { Component, OnInit } from '@angular/core';
import { ClientService } from '../shared/client.service';
import { Client } from '../shared/client';

@Component({
  selector: 'app-client-list',
  templateUrl: './client-list.component.html',
  styleUrls: ['./client-list.component.css']
})
export class ClientsComponent implements OnInit {

    private clients: Client[] = [];

    constructor(
        private clientService: ClientService
    ) { }

    // Pega a listagem de Clients ao iniciar
    ngOnInit() {
        this.clientService.getClients()
            .subscribe(data => {
                this.clients = data;
            }  );

    }

    // Apaga o client
    deleteClient(client) {
        if (confirm("Are you sure that you want to remove the client " + client.name + "?")) {
            var index = this.clients.indexOf(client);

            var rest = this.clients;

            this.clientService.deleteClient(client.id)
                .subscribe(function () {
                    rest.splice(index, 1);
                },
                erro => {
                    console.log("Erro ao excluir client: " + JSON.stringify(erro));
                    alert("Ocorreu um erro ao excluir o client.");
                });
        }
    }

}
