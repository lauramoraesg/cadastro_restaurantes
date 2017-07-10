import { Component, OnInit } from '@angular/core';
// Importa nosso service para conseguirmos falar com a API
import { RestauranteService } from '../shared/restaurante.service';
// Importa nosso Model
import { Restaurante } from '../shared/restaurante';
// Importa o Router para podermos conseguir pegar o parâmetro id
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-restaurante-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.css']
})
export class RestauranteFormComponent implements OnInit {

  // Cria uma variável string para falarmos se é uma edição ou criação de Restaurante
  title: string;
  // Pega nosso Model e coloca na variável restaurante
  restaurante: Restaurante = new Restaurante();

  constructor(
    //Declara dependências
    private restauranteService: RestauranteService,
    private router: Router,
    private route: ActivatedRoute
  ) { }

  // Roda enquanto a página é carregada para preencher o restaurante caso seja edição
  ngOnInit() {
    var id = this.route.params.subscribe(params => {
      var id = params['id'];

      this.title = id ? 'Edição de restaurante' : 'Cadastro de restaurante';

      if (!id)
        return;

      this.restauranteService.getRestaurante(id)
        .subscribe(
          restaurante => this.restaurante = restaurante,
          response => {});
    });
  }

  // Método chamado para criar/editar um restaurante
  save() {
    var result;

    if (this.restaurante.id){
      result = this.restauranteService.updateRestaurante(this.restaurante);
    } else {
      result = this.restauranteService.addRestaurante(this.restaurante);
    }

    result.subscribe(data => this.router.navigate(['/restaurantes']));
  }

}
