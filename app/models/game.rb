class Game < ActiveRecord::Base
  include Enumerize

  validates :name, :presence => true
  #validates_with PlayerValidator

  enumerize :level, :in => [:"1", :"2", :"3", :"4", :"5", :danger]
  enumerize :target, :in => [:children, :all, :casual, :gamer], :default => :all
  enumerize :time, :in => [:halfhour, :onehour, :onehourhalf, :twohour, :morethantwo], :default => :onehour

  has_many :editions
  accepts_nested_attributes_for :editions

  has_one :active_edition, :class_name => "Edition"
  accepts_nested_attributes_for :active_edition

end
