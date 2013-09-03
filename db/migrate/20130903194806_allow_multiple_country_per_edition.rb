class AllowMultipleCountryPerEdition < ActiveRecord::Migration
  def change
    add_column :editions, :country_ids, :json, null: false, default: []
  end
end
