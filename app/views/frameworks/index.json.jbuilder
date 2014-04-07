json.array!(@frameworks) do |framework|
  json.extract! framework, :id
  json.url framework_url(framework, format: :json)
end
