class Editor < ActiveRecord::Base
  has_many :editions
  belongs_to :country

  validates_uniqueness_of :name

  has_one :logo, :class_name => "Image", :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :logo

end
