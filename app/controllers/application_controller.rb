class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_ariane


  private

  def set_ariane
    ariane.add "Acceuil", root_path
  end
end
