class EditorsController < ApplicationController
  # GET /editors
  # GET /editors.json
  def index
    @editors = Editor.order("LOWER(name) asc").all
    @title = "Tous les editeurs"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @editors }
    end
  end

  # GET /editors/new
  # GET /editors/new.json
  def new
    @editor = Editor.new
    @editor.build_logo
    @title = "Creer un editeur"
    ariane.add "Nouvel editeur", new_editor_path
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @editor }
    end
  end

  # GET /editors/1/edit
  def edit
    @editor = Editor.find(params[:id])
    @editor.build_logo unless @editor.logo.present?
    ariane.add @editor.name, editor_path(@editor)
    ariane.add "Modifier", edit_editor_path(@editor)
  end

  # POST /editors
  # POST /editors.json
  def create
    @editor = Editor.new(editor_params)

    respond_to do |format|
      if @editor.save
        format.html { redirect_to editor_games_path(@editor), notice: 'Editor was successfully created.' }
        format.json { render json: @editor, status: :created, location: @editor }
      else
        @title = "Creer un editeur"
        format.html { render action: "new" }
        format.json { render json: @editor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /editors/1
  # PUT /editors/1.json
  def update
    @editor = Editor.find(params[:id])

    respond_to do |format|
      if @editor.update_attributes(editor_params)
        format.html { redirect_to editor_games_path(@editor), notice: 'Editor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @editor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editors/1
  # DELETE /editors/1.json
  def destroy
    @editor = Editor.find(params[:id])
    @editor.destroy

    respond_to do |format|
      format.html { redirect_to editors_url }
      format.json { head :no_content }
    end
  end

  private

  def editor_params
    params.require(:editor).permit(:name, :country_id, :url, :id,  logo_attributes: [:image, :remote_image_url, :id] )
  end

  def set_ariane
    super
    ariane.add "Les Editeurs", editors_path
  end

end
