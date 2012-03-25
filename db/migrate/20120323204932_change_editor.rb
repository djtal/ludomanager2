class ChangeEditor < ActiveRecord::Migration
  def change
    change_table :editions do |t|
      t.remove :primary
      t.string :kind
    end
  end
end
