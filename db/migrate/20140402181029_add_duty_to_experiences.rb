class AddDutyToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :duty, :text
  end
end
