
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
  class LegacyGame < ActiveRecord::Base
    establish_connection(
      :adapter => "mysql2",
      :host => "localhost",
      :username => ENV['MYSQL_USER'],
      :database => ENV['LEGACY_DATABASE'],
    )
    self.table_name = 'games'
    has_many :editions, table_name: 'editions', class_name: 'LegacyEdition', foreign_key: "game_id"
  end
  class LegacyAuthorship < ActiveRecord::Base
    establish_connection(
      :adapter => "mysql2",
      :host => "localhost",
      :username => ENV['MYSQL_USER'],
      :database => ENV['LEGACY_DATABASE'],
    )
    self.table_name = 'authorships'

  end
  class LegacyEdition < ActiveRecord::Base
    establish_connection(
      :adapter => "mysql2",
      :host => "localhost",
      :username => ENV['MYSQL_USER'],
      :database => ENV['LEGACY_DATABASE'],
    )
    self.table_name = 'editions'
  end
end
