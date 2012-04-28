class EditionsController < ApplicationController
  # GET /editions
  # GET /editions.json
  def index
    @editions = Edition.all

    ariane.add "Les Editeurs", editors_path
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @editions }
    end
  end

  # GET /editions/new
  # GET /editions/new.json
  def new
    @game = Game.find_by_id(params[:game_id])
    @edition = @game ? @game.editions.build : Edition.new
    @edition.name = @game.name if @game
    @edition.build_box_front
    if @game
      ariane.add "Les jeux", games_path
      ariane.add @game.name, game_path(@game)
      ariane.add "Nouvelle edition", new_edition_path
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @edition }
    end
  end

  # GET /editions/1/edit
  def edit
    @edition = Edition.find(params[:id])
  end

  # POST /editions
  # POST /editions.json
  def create
    @game = Game.find_by_id(params[:game_id]) if params[:game_id].present?
    @edition = @game ? @game.editions.build(params[:edition]) :  Edition.new(params[:edition])

    respond_to do |format|
      if @edition.save
        format.html { redirect_to @edition.game, notice: 'Edition was successfully created.' }
        format.json { render json: @edition, status: :created, location: @edition }
      else
        format.html { render action: "new" }
        format.json { render json: @edition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /editions/1
  # PUT /editions/1.json
  def update
    @edition = Edition.find(params[:id])

    respond_to do |format|
      if @edition.update_attributes(params[:edition])
        format.html { redirect_to @edition, notice: 'Edition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @edition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editions/1
  # DELETE /editions/1.json
  def destroy
    @edition = Edition.find(params[:id])
    @edition.destroy

    respond_to do |format|
      format.html { redirect_to editions_url }
      format.json { head :no_content }
    end
  end

end
