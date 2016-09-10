class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :member, :string
    add_column :users, :profile, :text
    add_column :users, :work, :string
  end
end
