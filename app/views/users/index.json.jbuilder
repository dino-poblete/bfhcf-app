json.array!(@users) do |user|
  json.extract! user, :id, :last_name, :first_name, :email
  json.url user_url(user, format: :json)
end
