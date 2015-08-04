class AddIndexToCategories < ActiveRecord::Migration
  def change
    add_index :name
  end
end
