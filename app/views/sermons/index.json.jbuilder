json.array!(@sermons) do |sermon|
  json.extract! sermon, :id, :title, :subtitle, :content, :posted_at, :user_id
  json.url sermon_url(sermon, format: :json)
end
