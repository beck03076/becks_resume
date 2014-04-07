class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.text :desc
      t.integer :created_by

      t.timestamps
    end
  end
end
