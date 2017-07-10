class ChangePrecoToPratos < ActiveRecord::Migration[5.1]
  def up
    change_table :pratos do |t|
      t.change :preco, :decimal, :precision => 10, :scale => 2
    end
  end
  def down
    change_table :pratos do |t|
      t.change :preco, :decimal, :precision => 10, :scale => 0
    end
  end
end