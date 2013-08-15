class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
    @editor = Editor.find_by_id(params[:editor_id]) if params[:editor_id]
    @person = Person.find_by_id(params[:person_id]) if params[:person_id]
    if @editor
      scoped = @editor.games
      @title = "#{@editor.name} : Les jeux"
      ariane.add @editor.name, editors_path
    elsif @person
      scoped = @person.games
      @title = "#{@person.fullname} : Les Jeux"
      ariane.add @person.fullname, people_path
    else
      scoped = Game
      @title = "Les Jeux"
    end
    if params[:target].present?
      scoped = Game.where(:target => params[:target])
      ariane.add Game.target.find_value(params[:target]).text, target_games_path(:target => params[:target])
    end
    if params[:time].present?
      scoped = scoped.where(:time => params[:time])
      ariane.add(Game.time.find_value(params[:time]).text, time_games_path(params[:time]))
    end
    @games = scoped.paginate(:per_page => 20, :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.joins(:editions).find_by_id(params[:id])
    @title = @game.name
    ariane.add @game.name, game_path(@game)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new
    @editor = Editor.find_by_id(params[:editor_id])
    @title = "Creer un nouveau jeu "
    @edition = @game.editions.build(editor: @editor)
    @edition.build_box_front
    @works = []
    @works << @game.works.build(:kind => :author)
    @works << @game.works.build(:kind => :illustrator)
    @base_games = Game.where(base_game_id: nil)
    ariane.add "Nouveau jeu", new_game_path
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.joins(:editions).find(params[:id])
    prepare_game
    if params[:kind] == "new_extension"
      @base = Game.possible_extensions.where(["id != ?", @game.id])
      @extensions = 3.times.inject([]){ |acc, _| acc << @game.extensions.build}
    end
    ariane.add @game.name, game_path(@game)
    ariane.add "Modifer", edit_game_path(@game)
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        @game.active_edition = @game.editions.first
        @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html {
          prepare_game
          render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def link_extensions
    @game = Game.find_by_id(params[:id])
    games = params[:extensions][:game].values.map{ |h| h[:id] }
    Game.where(id: games).update_all(base_game_id: @game.id)
    respond_to do |wants|
      wants.html { redirect_to @game, notice: 'Extensions added' }
    end
  end

  def unlink_extensions
    @game = Game.find_by_id(params[:id])
    extension = Game.find_by_id(params[:extension_id])
    extension.update_attributes(base_game_id: nil)
    respond_to do |wants|
      wants.html { redirect_to kind_edit_game_path(@game, :extensions), notice: "Extension unlinked"  }
    end

  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        prepare_game
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private

  def prepare_game
    @edition = Edition.new(:game => @game)
    @edition.name = @game.name if @game
    @edition.build_box_front
    @works = @game.works
    @editions = @game.editions.order(out_date: :desc)
  end

  def game_params
    params.require(:game).permit(:name, :min, :max, :base_game_id, :time, :target, :level,
                                 :works_attributes => [:person_id, :kind],
                                 :editions_attributes => [:name, :game_id, :editor_id, :out_date, :lang, :kind, :plateform,
                                 :box_front_attributes => [:remote_image_url]])
  end

  def set_ariane
    super
    ariane.add "Les Jeux", games_path
  end

end
