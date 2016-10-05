class AddUserIdToPrototype < ActiveRecord::Migration
  def change
    add_column :prototypes, :user_id, :integer
  end
end
