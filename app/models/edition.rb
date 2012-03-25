class Edition < ActiveRecord::Base
  include Enumerize

  belongs_to :editor
  belongs_to :game
  belongs_to :country, :foreign_key => :lang, :class_name => Country
  
  enumerize :kind, :in => [:primary, :transaltion, :digital]
  enumerize :plateform, :in => [:board, :web, :ios, :android]

  has_one :box_front, :class_name => Image, :as => :imageable
 
  accepts_nested_attributes_for :box_front

end
