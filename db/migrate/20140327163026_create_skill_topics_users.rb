class CreateSkillTopicsUsers < ActiveRecord::Migration
  def change
    create_table :skill_topics_users do |t|
      t.integer :user_id
      t.integer :skill_topic_id

      t.timestamps
    end
  end
end
