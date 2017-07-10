class CreatePratos < ActiveRecord::Migration[5.1]
  def change
    create_table :pratos do |t|
      t.string :nome
      t.decimal :preco

      t.references :restaurante

      t.timestamps
    end
  end
end
