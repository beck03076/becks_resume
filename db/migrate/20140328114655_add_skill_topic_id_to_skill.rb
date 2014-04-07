class AddSkillTopicIdToSkill < ActiveRecord::Migration
  def change
    add_column :skills, :skill_topic_id, :integer
  end
end
