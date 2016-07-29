class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
