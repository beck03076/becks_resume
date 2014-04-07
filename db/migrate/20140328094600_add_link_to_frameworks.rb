class AddLinkToFrameworks < ActiveRecord::Migration
  def change
    add_column :frameworks, :link, :text
  end
end
