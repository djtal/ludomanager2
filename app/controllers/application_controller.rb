class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_default


  private

  def set_default
    ariane.add "Acceuil", root_path
  end
end
