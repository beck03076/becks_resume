json.array!(@skill_topics) do |skill_topic|
  json.extract! skill_topic, :id
  json.url skill_topic_url(skill_topic, format: :json)
end
