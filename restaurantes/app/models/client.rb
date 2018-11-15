class Client < ApplicationRecord

  validates_presence_of :name, :cep, :street, :neighborhood, :city, :province, :phone
end