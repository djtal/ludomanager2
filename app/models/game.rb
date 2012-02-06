class Game < ActiveRecord::Base
  include Enumerize
  
  validates :name, :presence => true
  validates_with PlayerValidator
  
  enumerize :target, :in => [:children, :all, :casual, :gamer], :default => :all
  enumerize :time, :in => [:halfhour, :onehour, :onehourhalf, :twohour, :morethantwo], :default => :onehour
end
