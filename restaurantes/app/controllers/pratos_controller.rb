class PratosController < ApplicationController
  before_action :set_prato, only: [:show, :update, :destroy]

  def index
    @pratos = Prato.all
    render json: @pratos
  end

  def show
    render json: @prato
  end

  def create
    @prato = Prato.new(prato_params)
    if @prato.save
      render json: @prato, status: :created, location: @prato
    else
      render json: @prato.errors, status: :unprocessable_entity
    end
  end

  def update
    if @prato.update(prato_params)
      render json: @prato
    else
      render json: @prato.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @prato.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prato
      @prato = Prato.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def prato_params
      params.require(:prato).permit(:nome, :preco, :restaurante_id)
    end
end
