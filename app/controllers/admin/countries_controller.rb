class Admin::CountriesController < Admin::AdminController
  def index
    @countrie = Country.all
  end
end
