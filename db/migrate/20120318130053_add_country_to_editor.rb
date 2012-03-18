class AddCountryToEditor < ActiveRecord::Migration
  def change
    change_table :editors do |t|
      t.references :country
      t.remove  "logo_file_name"
      t.remove  "logo_content_type"
      t.remove  "logo_file_size"
      t.remove  "logo_updated_at"
    end
  end
end
