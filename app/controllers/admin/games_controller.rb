class Admin::GamesController < Admin::AdminController

  def index
    selection = params[:selection]
    @games = Game.joins(:active_edition => :box_front).paginate(:per_page => 40, :page => params[:page])    
  end
end
