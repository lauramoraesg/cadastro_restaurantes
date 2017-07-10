require 'rails_helper'

describe Restaurante do

  it "cria restaurante" do
    rest = Restaurante.create!(nome: "Hamburgueria")
    expect(Restaurante.first).to eq(rest)
  end

end
