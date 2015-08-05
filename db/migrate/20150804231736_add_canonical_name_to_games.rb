class AddCanonicalNameToGames < ActiveRecord::Migration
  def change
    add_column :games, :canonical_name, :string, index: true
  end
end
