# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@tech = YAML.load(File.open("#{Rails.root}/data/technologies.yml"))
@exp = YAML.load(File.open("#{Rails.root}/data/experience.yml"))
@hgh = YAML.load(File.open("#{Rails.root}/data/highlights.yml"))

p "========Starting Languages...========="
@tech[:languages].each do |l|
  if Language.where(name: l[:name],link: l[:link]).blank?
        p "Creating #{l}..."
        Language.create!(name: l[:name],
                         link: l[:link],
                         created_by: 1)
  else
    p "#{l[:name]} already exists..."
  end 
end

p "========Starting Frameworks...========="
@tech[:frameworks].each do |l|
  if Framework.where(name: l[:name],link: l[:link]).blank?
        p "Creating #{l[:name]}..."
        Framework.create!(name: l[:name],
                         link: l[:link],
                         created_by: 1)
  else
    p "#{l[:name]} already exists..."
  end 
end

p "========Starting SkillTopics...========="
@tech[:skills].each do |s|
  curr_skill_topic_id = nil
  if SkillTopic.where(name: s[:skill_topic]).blank?
        p "Creating #{s[:skill_topic]}..."
        curr_skill_topic_id = SkillTopic.create!(name: s[:skill_topic]).id
  else
    p "#{s[:skill_topic]} already exists..."
    curr_skill_topic_id = SkillTopic.find_by_name(s[:skill_topic]).id
  end 
  p "========Starting Skills For #{s[:skill_topic]}...========="
  s[:skill].each do |sk|
      if Skill.where(name: sk[:name]).blank?
        p "Creating #{sk[:name]}..."
        Skill.create!(name: sk[:name],link: sk[:link],skill_topic_id: curr_skill_topic_id)
      else
        p "#{sk[:name]} already exists..."
      end 
  end

p "========Starting Experiences...========="
@exp.each do |e|
  if Experience.where(from: e[:from],to: e[:to],company_link: e[:link]).blank?
        p "Creating #{e[:company]} = #{e[:from]} - #{e[:to]}..."
        Experience.create!(from: e[:from],
                           to: e[:to],
                           company_link: e[:link],
                           company: e[:company],
                           role: e[:role],
                           desc: e[:desc],
                           duty: e[:duty],
                           created_by: 1)
  else
    p "#{e[:company]} = #{e[:from]} - #{e[:to]} already exists..."
  end 
end

p "========Starting Highlights...========="
@hgh.each do |h|
  if Highlight.where(name: h[:name],link: h[:link]).blank?
        p "Creating #{h[:name]}..."
        Highlight.create!( name: h[:name],
                           link: h[:link],
                           desc: h[:desc],
                           created_by: 1)
  else
    p "#{h[:name]} already exists..."
  end 
end

p "=========== EnD ======================="

end

