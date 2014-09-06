json.array!(@github_events) do |github_event|
  json.extract! github_event, :id
  json.url github_event_url(github_event, format: :json)
end
