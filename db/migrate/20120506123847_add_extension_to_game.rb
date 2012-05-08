class AddExtensionToGame < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.references :base_game
      t.boolean :standalone, :default => false
    end
  end
end
