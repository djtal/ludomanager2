class AddOldids < ActiveRecord::Migration
  def change
    add_column :editors, :old_id, :integer
    add_column :people, :old_id, :integer
    add_column :games, :old_id, :integer
    add_column :editions, :old_id, :integer
  end
end
