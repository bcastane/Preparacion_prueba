class Pokemon < ActiveRecord::Base
	#validates_uniqueness_of :nombre

	 has_many :user_pokemons
     has_many :users, through: :user_pokemons
end
