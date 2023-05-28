json.extract! user, :id, :created_at, :updated_at, :email, :first_name, :last_name, :dob, :role
json.url user_url(user, format: :json)
