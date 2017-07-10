class PratosController < ApplicationController
  before_action :set_prato, only: [:show, :update, :destroy]

  # GET /pratos
  def index
    @pratos = Prato.all

    render json: @pratos
  end

  # GET /pratos/1
  def show
    render json: @prato
  end

  # POST /pratos
  def create
    @prato = Prato.new(prato_params)
    if @prato.save
      render json: @prato, status: :created, location: @prato
    else
      render json: @prato.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pratos/1
  def update
    if @prato.update(prato_params)
      render json: @prato
    else
      render json: @prato.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pratos/1
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
