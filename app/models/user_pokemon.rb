class UserPokemon < ActiveRecord::Base
  after_create :set_default
  belongs_to :user
  belongs_to :pokemon

  def set_default
  	self.nivel = nivel || 0 	
  end


end
