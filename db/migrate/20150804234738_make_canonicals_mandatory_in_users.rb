class MakeCanonicalsMandatoryInUsers < ActiveRecord::Migration
  def change
    change_column :users, :canonical_name, :string, null: false
    change_column :users, :canonical_username, :string, null: false
  end
end
