class CreateUserPokemons < ActiveRecord::Migration
  def change
    create_table :user_pokemons do |t|
      t.references :user, index: true, foreign_key: true
      t.references :pokemon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
