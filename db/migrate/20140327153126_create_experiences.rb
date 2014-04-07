class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.date :from
      t.date :to
      t.string :role
      t.string :company
      t.string :company_link
      t.text :desc

      t.timestamps
    end
  end
end
