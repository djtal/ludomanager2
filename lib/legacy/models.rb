
module Legacy
  class LegacyEditor < ActiveRecord::Base
    establish_connection(
      :adapter => "mysql2",
      :host => "localhost",
      :username => ENV['MYSQL_USER'],
      :database => ENV['LEGACY_DATABASE'],
    )
    self.table_name = 'editors'
  end
  class LegacyAuthor < ActiveRecord::Base
    establish_connection(
      :adapter => "mysql2",
      :host => "localhost",
      :username => ENV['MYSQL_USER'],
      :database => ENV['LEGACY_DATABASE'],
    )
    self.table_name = 'authors'
  end
end
