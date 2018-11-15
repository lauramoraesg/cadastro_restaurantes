require 'net/http'
require 'json'

class CepsController < ApplicationController
  before_action :find_address, only: [:show]

  def show
    render json: @address
  end

  private
  def find_address
    request = Net::HTTP.get_response("viacep.com.br", "/ws/#{params[:id]}/json/")
    @address = JSON.parse(request.body)
  end

end