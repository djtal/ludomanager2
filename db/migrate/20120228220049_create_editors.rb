class CreateEditors < ActiveRecord::Migration
  def change
    create_table :editors do |t|
      t.string :name, :url
      t.string :lang
      t.has_attached_file :logo
    end
  end
end