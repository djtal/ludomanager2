class CreateCreators < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.references :person
      t.references :game
      t.string :kind
      t.timestamps
    end
  end
end
