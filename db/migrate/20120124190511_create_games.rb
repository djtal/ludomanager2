class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :min, :max
      t.string :name
      t.integer :level, :default => 2
      t.timestamps
    end
  end
end
