class Editor < ActiveRecord::Base
  attr_accessible :name, :url, :country_id, :logo, :remote_logo_url
  has_many :editions
  belongs_to :country

  validates_uniqueness_of :name

  mount_uploader :logo, ImageUploader
end
