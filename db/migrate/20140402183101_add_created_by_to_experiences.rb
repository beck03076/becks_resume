class AddCreatedByToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :created_by, :integer
  end
end
