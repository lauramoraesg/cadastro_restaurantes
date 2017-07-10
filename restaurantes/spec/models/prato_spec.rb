require 'rails_helper'

describe Prato do

  before do
    Restaurante.create!(nome: "Hamburgueria")
  end

  it "cria prato" do
    prato = Prato.create!(:nome => "x-burguer", :restaurante_id => Restaurante.first.id, :preco => 10.90)
    expect(Prato.first).to eq(prato)
  end
end
