class CreateAccountGames < ActiveRecord::Migration
  def change
    create_table :account_games do |t|
    	t.references :game
    	t.references :account
      t.timestamps
    end
  end
end
