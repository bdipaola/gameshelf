class AddCanonicalUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :canonical_username, :string, index: true
    add_column :users, :canonical_name, :string, index: true
  end
end
