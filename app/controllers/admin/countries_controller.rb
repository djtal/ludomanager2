class Admin::CountriesController < ApplicationController
  def index
    @countrie = Country.all
  end
end
