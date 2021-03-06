class CreateEditions < ActiveRecord::Migration
  def change
    create_table :editions do |t|
      t.references :game
      t.references :editor
      t.string :lang
      t.string :plateform
      t.boolean :primary
      t.date :out_date
    end
  end
end
