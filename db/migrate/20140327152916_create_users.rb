class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.text :summary
      t.string :email
      t.string :mobile
      t.text :address
      t.string :github_text
      t.text :github_link
      t.string :twitter_text
      t.text :twitter_link
      t.string :fb_link
      t.text :fb_text
      t.string :so_text
      t.text :so_link

      t.timestamps
    end
  end
end
