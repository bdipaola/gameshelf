class AddIndicesToGames < ActiveRecord::Migration
  def change
    add_index :min_players
    add_index :max_players
  end
end
