import { Component, OnInit } from '@angular/core';
// Importa service para falar com a API
import { PratoService } from '../shared/prato.service';
// Importa Model
import {Prato} from '../shared/prato';
import {Restaurante} from '../../restaurantes/shared/restaurante';
import {RestauranteService} from '../../restaurantes/shared/restaurante.service';
// Importa o Router para pegar o parâmetro id
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-prato-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.css']
})
export class PratoFormComponent implements OnInit {

  // variável para ver se é  edição ou criação de prato
  title: string;
  // Pega Model e coloca na variável prato
  prato: Prato = new Prato();
  restaurantes: Restaurante[] = Array();

  constructor(
    //Declara  dependências
    private pratoService: PratoService,
    private router: Router,
    private route: ActivatedRoute,
    private restauranteService: RestauranteService
  ) { }

  // Método roda enquanto a página é carregada para preencher o prato caso seja edição
  ngOnInit() {
    var id = this.route.params.subscribe(params => {
      var id = params['id'];

      this.title = id ? 'Edição de prato' : 'Cadastro de prato';

      this.restauranteService.getRestaurantes('')
        .subscribe(restaurantes => {
          this.restaurantes = restaurantes;

          if (!id)
            return;

          this.pratoService.getPrato(id)
            .subscribe(prato => this.prato = prato)
        });
      });
  }


  // Método chamado no form para criar/editar prato
  save() {
    var result;

    if (this.prato.id){
      result = this.pratoService.updatePrato(this.prato);
    } else {
      result = this.pratoService.addPrato(this.prato);
    }

    result.subscribe(data => this.router.navigate(['/pratos']));
  }

}
