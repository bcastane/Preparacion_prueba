class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: :index
  # GET /pokemons
  # GET /pokemons.json
  def index

    @pokemons = current_user.pokemons
    
  end

  # GET /pokemons/1
  # GET /pokemons/1.json
  def show
  end

  def mostrar_pokemon
    @user=current_user
    @pokemons =Pokemon.all

  end

  def agregar_pokemon

    pokemon = Pokemon.where(:id => params[:user][:pokemon_ids])
    current_user.pokemons = pokemon
    current_user.save 
   # raise "errors"


  end

  def pokeuser
    @user = User.find(params[:id])
    @pokemons = @user.pokemons

  end

  # GET /pokemons/new
  def new
    @pokemon = Pokemon.new
  end

  # GET /pokemons/1/edit
  def edit
  end

  def level_up
    pokemon = Pokemon.find(params[:id])
    up = pokemon.user_pokemons.first
    up.nivel +=  1
    up.save
    redirect_to pokemons_path
  end

  # POST /pokemons
  # POST /pokemons.json
  def create
    @pokemon = Pokemon.new(pokemon_params)

    respond_to do |format|
      if @pokemon.save
        format.html { redirect_to @pokemon, notice: 'Pokemon was successfully created.' }
        format.json { render :show, status: :created, location: @pokemon }
      else
        format.html { render :new }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemons/1
  # PATCH/PUT /pokemons/1.json
  def update
    respond_to do |format|
      if @pokemon.update(pokemon_params)
        format.html { redirect_to @pokemon, notice: 'Pokemon was successfully updated.' }
        format.json { render :show, status: :ok, location: @pokemon }
      else
        format.html { render :edit }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemons/1
  # DELETE /pokemons/1.json
  def destroy
    @pokemon.destroy
    respond_to do |format|
      format.html { redirect_to pokemons_url, notice: 'Pokemon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pokemon_params
      params.require(:pokemon).permit(:nombre, :descripcion, :nivel)
    end
end
