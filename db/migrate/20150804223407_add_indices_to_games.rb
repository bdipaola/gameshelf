class AddIndicesToGames < ActiveRecord::Migration
  def change
    add_index :games, :min_players
    add_index :games, :max_players
  end
end
