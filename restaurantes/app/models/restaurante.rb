class Restaurante < ApplicationRecord

  has_many :pratos

  validates_presence_of :nome

end
