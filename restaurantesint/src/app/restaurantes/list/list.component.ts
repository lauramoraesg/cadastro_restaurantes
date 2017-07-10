import { Component, OnInit } from '@angular/core';
// Importa Service
import { RestauranteService } from '../shared/restaurante.service';
// Importa Model
import {Restaurante} from '../shared/restaurante';

@Component({
  selector: 'app-restaurantes',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class RestaurantesComponent implements OnInit {
  textoPesquisa: string = "";

  private restaurantes: Restaurante[] = [];

  constructor(private restauranteService: RestauranteService) { }

  // Pega a listagem de Restaurantes ao iniciar
  ngOnInit() {
    this.buscarRestaurante();
  }

  // Apaga o Restaurante
  deleteRestaurante(restaurante) {
    if (confirm("Você tem certeza que quer deletar o restaurante " + restaurante.nome + "?")) {
      var index = this.restaurantes.indexOf(restaurante);

      var rest = this.restaurantes;

      this.restauranteService.deleteRestaurante(restaurante.id)
        .subscribe(function () {
          rest.splice(index, 1);
        },
        erro => {
          console.log("Erro ao excluir restaurante: " + JSON.stringify(erro));
          alert("Ocorreu um erro ao excluir o restaurante.");
        });
    }
  }

  buscarRestaurante(){
    this.restauranteService.getRestaurantes(this.textoPesquisa)
      .subscribe(data => this.restaurantes = data);
  }

}
