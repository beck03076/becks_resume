json.array!(@highlights) do |highlight|
  json.extract! highlight, :id, :name, :link, :desc, :created_by, :user_id
  json.url highlight_url(highlight, format: :json)
end
