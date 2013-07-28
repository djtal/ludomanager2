class RenameCreator < ActiveRecord::Migration
  def up
    rename_table :creators, :works
  end

  def down
    rename_table :works, :creators
  end
end
