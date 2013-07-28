class Person < ActiveRecord::Base

  validates_presence_of :first_name, :last_name
  has_one :country

  has_many :works
  has_many :games, through: :works

  def fullname
    [self.first_name, self.last_name] * " "
  end

  def fullname=(name)
    split = " "
    split = "-" if name.include?("-")
    self.first_name, self.last_name = name.split(split)
  end

end
