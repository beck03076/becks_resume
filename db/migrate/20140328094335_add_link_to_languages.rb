class AddLinkToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :link, :text
  end
end
