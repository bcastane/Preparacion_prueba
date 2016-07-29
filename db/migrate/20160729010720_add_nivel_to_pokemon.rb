class AddNivelToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :nivel, :integer
  end
end
