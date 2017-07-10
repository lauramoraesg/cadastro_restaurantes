import { Component, OnInit } from '@angular/core';
// Importa Service
import { PratoService } from '../shared/prato.service';
import { RestauranteService } from '../../restaurantes/shared/restaurante.service';
// Importa nosso model
import {Prato} from '../shared/prato';

@Component({
  selector: 'app-pratos',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class PratosComponent implements OnInit {

  private pratos: Prato[] = [];

  constructor(
    private pratosService: PratoService,
    private restauranteService: RestauranteService
  ) { }

  // Pega a listagem de Pratos ao iniciar
  ngOnInit() {
    this.pratosService.getPratos()
      .subscribe(data => {
        //data é um array de pratos
        for (let prato of data){
          this.restauranteService.getRestaurante(prato.restaurante_id)
            .subscribe(restaurante => prato.restaurante_nome = restaurante.nome);
        }
        this.pratos = data;
      });
  }

  // Apaga o prato
  deletePrato(prato) {
    if (confirm("Você tem certeza que quer excluir o prato " + prato.title + "?")) {
      var index = this.pratos.indexOf(prato);
      this.pratos.splice(index, 1);

      this.pratosService.deletePrato(prato.id)
        .subscribe(null);
    }
  }

}
