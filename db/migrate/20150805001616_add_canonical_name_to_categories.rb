class AddCanonicalNameToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :canonical_name, :string, index: true
  end
end
