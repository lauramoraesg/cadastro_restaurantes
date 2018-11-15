class ClientsController < ApplicationController
  before_action :find_client, only: [:show, :update, :destroy]

  def index
    clients = Client.all
    render json: clients
  end

  def show
    render json: @client
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def find_client
    @client = Client.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def client_params
    params.require(:client).permit(:name, :cep, :street, :complement, :neighborhood, :city, :province, :phone)
  end
end
