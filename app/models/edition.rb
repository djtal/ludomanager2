class Edition < ActiveRecord::Base
  extend Enumerize
  validates_presence_of :editor_id, :lang

  before_save :ensure_name, :if => lambda{ self.name.blank? }

  belongs_to :editor
  belongs_to :game
  belongs_to :country, :foreign_key => :lang, :class_name => Country

  enumerize :kind, :in => [:primary, :transaltion, :digital, :reedition], :default => :primary
  enumerize :plateform, :in => [:board, :web, :ios, :android], :default => :board

  has_one :box_front, :class_name => Image, :as => :imageable, dependent: :delete

  accepts_nested_attributes_for :box_front

  scope :primary, -> { where(:kind => :primary) }

  def active?
    game.active_edition == self
  end

  def ensure_name
    self.name = self.game.name
  end
end
