class AddKeys < ActiveRecord::Migration[5.1]
  def up
    add_foreign_key :pratos, :restaurantes
  end

  def down

  end
end
