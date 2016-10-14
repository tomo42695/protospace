class RemoveTextFromPrototypes < ActiveRecord::Migration
  def change
    remove_column :prototypes, :text, :text
  end
end
