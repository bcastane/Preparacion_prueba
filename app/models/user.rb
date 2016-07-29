class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


     enum role: [ :admin, :editor, :user]

     has_many :user_pokemons
     has_many :pokemons, through: :user_pokemons
end
