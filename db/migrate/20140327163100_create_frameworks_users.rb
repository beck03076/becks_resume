class CreateFrameworksUsers < ActiveRecord::Migration
  def change
    create_table :frameworks_users do |t|
      t.integer :user_id
      t.integer :framework_id

      t.timestamps
    end
  end
end
