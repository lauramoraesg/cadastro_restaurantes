class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :cep
      t.string :street
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :province
      t.string :phone

      t.timestamps
    end
  end
end