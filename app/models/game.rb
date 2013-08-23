class Game < ActiveRecord::Base
  extend Enumerize


  validates :name, :presence => true
  #validates_with PlayerValidator

  enumerize :level, :in => [:"1", :"2", :"3", :"4", :"5", :danger]
  enumerize :target, :in => [:children, :all, :casual, :gamer], :default => :all
  enumerize :time, :in => [:halfhour, :onehour, :onehourhalf, :twohour, :morethantwo], :default => :onehour

  has_many :editions
  accepts_nested_attributes_for :editions
  belongs_to :active_edition, :class_name => "Edition"
  accepts_nested_attributes_for :active_edition

  has_many :editors, through: :editions

  has_many :works
  accepts_nested_attributes_for :works
  has_many :creator_authors, -> { where(kind: :author) }, class_name:  "Work"
  has_many :creator_artists, -> { where(kind: :artist) }, class_name: "Work"
  has_many :authors, :through => :creator_authors, :source => :person
  accepts_nested_attributes_for :authors, reject_if: proc { |attributes| attributes['id'].blank? }
  has_many :artists, :through => :creator_artists, :source => :person
  accepts_nested_attributes_for :artists

  has_many :extensions, :class_name => "Game", :foreign_key => "base_game_id"
  belongs_to :base_game, :class_name => "Game"

  scope :by_target, lambda { |target| where(:target => target)}
  scope :by_time, lambda { |time| where(:time => time)}
  scope :possible_extensions, -> { where(:base_game_id => nil) }

  def base_game?
    base_game_id.blank?
  end

end
