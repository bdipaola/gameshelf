class AddIndicesToUsers < ActiveRecord::Migration
  def change
    add_index :name
    add_index :username
  end
end
