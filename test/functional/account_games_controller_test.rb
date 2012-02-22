require 'test_helper'

class AccountGamesControllerTest < ActionController::TestCase
  setup do
    @account_game = account_games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_game" do
    assert_difference('AccountGame.count') do
      post :create, account_game: @account_game.attributes
    end

    assert_redirected_to account_game_path(assigns(:account_game))
  end

  test "should show account_game" do
    get :show, id: @account_game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_game
    assert_response :success
  end

  test "should update account_game" do
    put :update, id: @account_game, account_game: @account_game.attributes
    assert_redirected_to account_game_path(assigns(:account_game))
  end

  test "should destroy account_game" do
    assert_difference('AccountGame.count', -1) do
      delete :destroy, id: @account_game
    end

    assert_redirected_to account_games_path
  end
end
