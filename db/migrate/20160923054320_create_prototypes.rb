class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.text :title
      t.text :text
      t.text :catchcopy
      t.text :concept
      t.timestamps null: false
    end
  end
end
