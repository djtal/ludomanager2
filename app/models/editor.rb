class Editor < ActiveRecord::Base
  has_many :editions
  belongs_to :country

  validates_uniqueness_of :name

  mount_uploader :logo, ImageUploader
end
