class Prato < ApplicationRecord

  belongs_to :restaurante

  validates_presence_of :nome, :restaurante_id, :preco

end