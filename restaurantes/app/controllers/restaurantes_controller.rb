class RestaurantesController < ApplicationController
  before_action :set_restaurante, only: [:show, :update, :destroy]

  # GET /restaurantes
  def index
    texto = params[:textoBusca]
    if texto.nil?
      texto = ""
    end

    @restaurantes = Restaurante.where("nome like ?", "%" + texto + "%")

    render json: @restaurantes
  end

  # GET /restaurantes/1
  def show
    render json: @restaurante
  end

  # POST /restaurantes
  def create
    @restaurante = Restaurante.new(restaurante_params)

    if @restaurante.save
      render json: @restaurante, status: :created, location: @restaurante
    else
      render json: @restaurante.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /restaurantes/1
  def update
    if @restaurante.update(restaurante_params)
      render json: @restaurante
    else
      render json: @restaurante.errors, status: :unprocessable_entity
    end
  end

  # DELETE /restaurantes/1
  def destroy
    @restaurante.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurante
      @restaurante = Restaurante.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def restaurante_params
      params.require(:restaurante).permit(:nome)
    end

end
