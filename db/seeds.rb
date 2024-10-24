# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Actors
emails = ['a@b.com', 'b@b.com' 'c@b.com', 'd@b.com', 'e@b.com']

# t.integer "user_id", null: false
# t.string "type"
emails.each_with_index do |email, i|
  next if User.exists?(email_address: email)

  user = User.create!(email_address: email, password_digest: BCrypt::Password.create('abcd'), name: "Jeffrey #{i}")
  functionality = UserType.create!(user: user, type: 'Actor')
  ActorFunctionality.create!(user_type_id: functionality.id, rating: 10, about_me: i, date_of_birth: Date.today - 1, city: 'Toronto')
end

