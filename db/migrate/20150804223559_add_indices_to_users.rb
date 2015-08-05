class AddIndicesToUsers < ActiveRecord::Migration
  def change
    add_index :users, :name
    add_index :users, :username
  end
end
