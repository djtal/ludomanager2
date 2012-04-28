class Edition < ActiveRecord::Base
  include Enumerize
  validates_presence_of :editor_id, :lang

  belongs_to :editor
  belongs_to :game
  belongs_to :country, :foreign_key => :lang, :class_name => Country

  enumerize :kind, :in => [:primary, :transaltion, :digital, :reedition], :default => :primary
  enumerize :plateform, :in => [:board, :web, :ios, :android], :default => :board

  has_one :box_front, :class_name => Image, :as => :imageable

  accepts_nested_attributes_for :box_front

  scope :primary, where(:kind => :primary)
end
