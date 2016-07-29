class AddNivelToUserPokemon < ActiveRecord::Migration
  def change
    add_column :user_pokemons, :nivel, :integer
  end
end
