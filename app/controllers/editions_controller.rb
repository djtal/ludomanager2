class EditionsController < ApplicationController

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
