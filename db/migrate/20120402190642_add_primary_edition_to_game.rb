class AddPrimaryEditionToGame < ActiveRecord::Migration
  def change
    add_column :games, :active_edition_id, :integer
  end
end
