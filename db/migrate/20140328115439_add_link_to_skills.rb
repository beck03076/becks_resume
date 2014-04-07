class AddLinkToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :link, :text
  end
end
