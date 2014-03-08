json.array!(@devotionals) do |devotional|
  json.extract! devotional, :id
  json.url devotional_url(devotional, format: :json)
end
