class AddPrimaryEditionToGame < ActiveRecord::Migration
  def change
    add_column :games, :integer, :active_edition_id
  end
end
