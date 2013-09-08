class AddGameFamilly < ActiveRecord::Migration
  def change
    add_column :games, :familly, :string
  end
end
