class Editor < ActiveRecord::Base
  has_many :editions
  has_one :country

  has_many :games, :through => :editions
  validates_presence_of :name, :country_id
  validates_uniqueness_of :name

  has_one :logo, :class_name => "Image", :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :logo

end
