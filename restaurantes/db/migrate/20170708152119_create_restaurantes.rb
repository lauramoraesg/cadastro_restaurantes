class CreateRestaurantes < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurantes do |t|
      t.string :nome

      t.timestamps
    end
  end
end
