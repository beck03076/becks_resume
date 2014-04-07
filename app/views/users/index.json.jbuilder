json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :middle_name, :last_name, :summary, :email, :mobile, :address, :github_text, :github_link, :twitter_text, :twitter_link, :fb_link, :fb_text, :so_text, :so_link
  json.url user_url(user, format: :json)
end
