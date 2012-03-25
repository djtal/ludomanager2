class AddImageToEditor < ActiveRecord::Migration
  def change
    add_column :editors, :logo, :string
  end
end
