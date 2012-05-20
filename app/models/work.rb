class Work < ActiveRecord::Base
  belongs_to :game
  belongs_to :person
  accepts_nested_attributes_for :person
end
