json.array!(@events) do |event|
  json.extract! event, :id, :title, :ministry, :start_date, :end_date, :picture, :content
  json.url event_url(event, format: :json)
end
