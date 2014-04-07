class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :name
      t.text :link
      t.text :desc
      t.integer :created_by
      t.integer :user_id

      t.timestamps
    end
  end
end
