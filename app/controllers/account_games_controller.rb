class AccountGamesController < ApplicationController
  before_filter :authenticate_account!
  
  # GET /account_games
  # GET /account_games.json
  def index
    query = current_account.account_games.includes(:game)
    if params[:target] || params[:time]
        query = query.where({games: {target: params[:target]}}) if params[:target]
        query = query.where({games: {time: params[:time]}}) if params[:time]
    end
    
    @account_games = query.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_games }
    end
  end

  # GET /account_games/1
  # GET /account_games/1.json
  def show
    @account_game = AccountGame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account_game }
    end
  end

  # GET /account_games/new
  # GET /account_games/new.json
  def new
    @account_game = current_account.account_games.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_game }
    end
  end

  # GET /account_games/1/edit
  def edit
    @account_game = current_account.account_games.find(params[:id])
  end

  # POST /account_games
  # POST /account_games.json
  def create
    @account_game = current_account.account_games.build(params[:account_game])

    respond_to do |format|
      if @account_game.save
        format.html { redirect_to account_account_games_path(current_account), notice: 'Account game was successfully created.' }
        format.json { render json: @account_game, status: :created, location: @account_game }
      else
        format.html { render action: "new" }
        format.json { render json: @account_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /account_games/1
  # PUT /account_games/1.json
  def update
    @account_game = AccountGame.find(params[:id])

    respond_to do |format|
      if @account_game.update_attributes(params[:account_game])
        format.html { redirect_to account_account_games_path(current_account), notice: 'Account game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_games/1
  # DELETE /account_games/1.json
  def destroy
    @account_game = current_account.account_games.find(params[:id])
    @account_game.destroy

    respond_to do |format|
      format.html { redirect_to account_account_games_url(current_account) }
      format.json { head :no_content }
    end
  end
end
