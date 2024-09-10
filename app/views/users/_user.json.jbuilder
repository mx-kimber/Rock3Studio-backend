json.array!(@users) do |user|
  json.extract! user, :id, :full_name, :user_name, :email, :password_digest, :created_at, :updated_at
  json.rocks user.rocks, partial: 'rocks/rock', as: :rock
end
