class AddNameToEdition < ActiveRecord::Migration
  def change
    add_column :editions, :name, :string
  end
end
