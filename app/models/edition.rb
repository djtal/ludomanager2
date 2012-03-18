class Edition < ActiveRecord::Base
  belongs_to :editor
  belongs_to :game
end
