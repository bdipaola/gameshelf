class MakeCanonicalNameMandatoryInGames < ActiveRecord::Migration
  def change
    change_column :games, :canonical_name, :string, null: false
  end
end
