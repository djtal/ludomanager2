class AccountGame < ActiveRecord::Base
	validate :game_id, uniqueness: true, scope: :account_id
	validate :game_id, :account_id,  presence: true
	belongs_to :game
end
