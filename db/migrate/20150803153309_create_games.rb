class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, null: false, index: true
      t.integer :category_id
      t.text    :description, null: false
      t.integer :min_players
      t.integer :max_players

      t.timestamps null: false
    end
  end
end
