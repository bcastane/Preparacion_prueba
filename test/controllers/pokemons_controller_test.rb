require 'test_helper'

class PokemonsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @pokemon = pokemons(:one)
  end

  test "user one should have 3 pokemon" do
    a = users(:one)
    npokemons = a.pokemons.count

    assert_equal 3, npokemons
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pokemons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pokemon" do
    assert_difference('Pokemon.count') do
      post :create, pokemon: { descripcion: @pokemon.descripcion, nombre: @pokemon.nombre }
    end

    assert_redirected_to pokemon_path(assigns(:pokemon))
  end

  test "should show pokemon" do
    get :show, id: @pokemon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pokemon
    assert_response :success
  end

  test "should update pokemon" do
    patch :update, id: @pokemon, pokemon: { descripcion: @pokemon.descripcion, nombre: @pokemon.nombre }
    assert_redirected_to pokemon_path(assigns(:pokemon))
  end

  test "should destroy pokemon" do
    assert_difference('Pokemon.count', -1) do
      delete :destroy, id: @pokemon
    end

    assert_redirected_to pokemons_path
  end
end
