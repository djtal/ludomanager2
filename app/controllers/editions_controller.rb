class EditionsController < ApplicationController

  # POST /editions
  # POST /editions.json
  def create
    @game = Game.find_by_id(params[:game_id]) if params[:game_id].present?
    @edition = @game ? @game.editions.build(edition_params) :  Edition.new(edition_params)

    respond_to do |format|
      if @edition.save
        format.html { redirect_to kind_edit_game_path(@game, :editions), notice: 'Edition was successfully updated.' }
        format.json { render json: @edition, status: :created, location: @edition }
      else
        format.html { render action: "edit", controller: "games" }
        format.json { render json: @edition.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @game = Game.find_by_id(params[:game_id])
    @edition = @game.editions.find(params[:id])
    ariane.add @game.name, game_path(@game)
    ariane.add "#{@edition.name} (#{@edition.editor.name})"
  end

  # PUT /editions/1
  # PUT /editions/1.json
  def update
    @game = Game.find_by_id(params[:game_id])
    @edition = @game.editions.find(params[:id])

    respond_to do |format|
      if @edition.update_attributes(edition_params)
        format.html { redirect_to kind_edit_game_path(@game, :editions), notice: 'Edition was successfully updated.' }
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
    @game = Game.find_by_id(params[:game_id])
    @edition = @game.editions.find(params[:id])
    @edition.destroy

    respond_to do |format|
      format.html { redirect_to kind_edit_game_path(@game, :editions) }
      format.json { head :no_content }
    end
  end

  def make
    @game = Game.find(params[:game_id])
    @edition = @game.editions.find(params[:id])
    respond_to do |format|
      if @game.update_attribute :active_edition_id, @edition.id
        format.html { redirect_to @game, info: "L'edition #{@edition.name} est la principale"}
      else
        format.html { render "games/edit" }
      end
    end

  end

  private

  def edition_params
    params.require(:edition).permit(:game_id, :id, :editor_id, :out_date, :kind, :plateform, :name, country_ids: [],
                                  :box_front_attributes => [:id, :image, :remote_image_url, :_destroy])
  end

end
