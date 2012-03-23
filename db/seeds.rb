# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



def load_countries
   country = YAML.load_file("db/country.yaml")
  return unless country
  country.each do |code, name|
    c = Country.new do |c|
      c.code = code
      c.name = name
    end
    c.save
  end
end


load_countries
