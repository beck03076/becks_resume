class Skill < ActiveRecord::Base
  belongs_to :skill_topic
  belongs_to :user
end
