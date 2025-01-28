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
fake_users = [
  {
    name: 'Amanda Hugnkiss',
    about_me: 'I love to snow board',
    date_of_birth: '01/23/1927',
    city: 'Toronto'
  },
  {
    name: 'Anita Bath',
    about_me: 'Coffee enthusiast and marathon runner',
    date_of_birth: '07/04/1988',
    city: 'Calgary'
  },
  {
    name: 'Maya',
    about_me: 'Amateur cloud watcher',
    date_of_birth: '03/17/1995',
    city: 'Edmonton'
  },
  {
    name: 'Mike',
    about_me: 'Professional pizza taste tester',
    date_of_birth: '05/15/1985',
    city: 'Vancouver'
  },
  {
    name: 'Hugh',
    about_me: 'Aspiring cat whisperer',
    date_of_birth: '12/31/1992',
    city: 'Montreal'
  },

  {
    name: 'Al',
    about_me: 'Professional couch potato',
    date_of_birth: '09/28/1975',
    city: 'Ottawa'
  },
  {
    name: 'Oliver',
    about_me: 'Certified nap expert',
    date_of_birth: '11/11/1982',
    city: 'Winnipeg'
  }
]

fake_users.each_with_index do |actor, i|

  email = "#{actor[:name].split(' ').join('')}@bab.com"

  next if User.exists?(email_address: email)

  user = User.find_or_create_by!(email_address: email, password_digest: BCrypt::Password.create('abcd'), name: actor[:name])
  user.save
  functionality = UserType.find_or_create_by!(user: user, type: Actor)
  af = ActorFunctionality.find_or_create_by!(user_type_id: functionality.id, rating: 10, about_me: actor[:about_me], date_of_birth: Date.strptime(actor[:date_of_birth], '%m/%d/%Y'))
  Photo.create_from_image!(File.open(Dir[Rails.root.join('test', 'fixtures', 'files', "#{i + 1}.*")].first), user_id: user.id)
end

# Casting
casting_directors_emails = ['john@cd.com', 'jane@cd.com', 'james@cd.com']

casting_directors_emails.each_with_index do |email, index|
  user = User.find_or_create_by(
             email_address: email,
             name: email.split('@')[0])
  user.password_digest = BCrypt::Password.create('abcd')
  user.save!
  userType = CastingDirector.find_or_create_by!(user: user)
  [ "One off #{index}" , "Assistant #{index}" ].each do |movie_title|
    userType.castings.find_or_create_by!(name: movie_title, description: 'I want an actor for this movie')
  end

  [ "Toy Story #{index}" , "Sharknado #{index}" ].each do |movie_title|
    project = userType.projects.find_or_create_by!(
      name: movie_title,
      description: 'Big ol\' movie'
    )
    project = project.castings.find_or_create_by!(user_type_id: userType.id, name: movie_title, description: 'I want an actor for this movie')
  end
end

