json.array!(@users) do |user|
  json.extract! user, :id, :nombre, :apellido, :correo, :password
  json.url user_url(user, format: :json)
end
