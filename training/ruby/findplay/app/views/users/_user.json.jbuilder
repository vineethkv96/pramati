json.extract! user, :id, :user_id, :name, :phone_number, :address, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
