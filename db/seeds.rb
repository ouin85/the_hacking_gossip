# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ---------------------------------------------------------------------
# --- Seed our database by some records ---
# --- Before anything, delete all records from each tables ---
# --- and reset primary key sequence in order to start again from 1 ---
Rails.application.eager_load!
ApplicationRecord.descendants.each { |model|
  model.delete_all
  ActiveRecord::Base.connection.reset_pk_sequence!(model.table_name)
}

# Generate 10 cities
10.times do
  City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end
# c = City.last

# Generate 10 users
10.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.most_interesting_man_in_the_world, email: Faker::Internet.email, age: Faker::Number.within(range: 15..45), city_id: Faker::Number.within(range: 1..10), password: 'wazo6556')
  # User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.most_interesting_man_in_the_world, email: Faker::Internet.email, age: Faker::Number.within(range: 15..45), city: c)
end
# u = User.last

# Generate 20 gossips
20.times do
  Gossip.create!(title: Faker::Hacker.adjective, content: Faker::Hacker.say_something_smart, user_id: Faker::Number.within(range: 1..10))
  # Gossip.create!(title: Faker::Hacker.adjective, content: Faker::Hacker.say_something_smart, user: u)
end
# g = Gossip.last

# Generate 10 tags
10.times do
  Tag.create!(title: Faker::Hacker.abbreviation)
end
# t = Tag.last

# Generate 10 relations tag/gossip
10.times do
  GossipsTag.create!(tag_id: Faker::Number.within(range: 1..10), gossip_id: Faker::Number.within(range: 1..20))
  # GossipsTag.create!(tag: t, gossip: g)
end

# Generate 10 comments
10.times do
  Comment.create(content: Faker::Hacker.say_something_smart, gossip_id: Faker::Number.within(range: 1..20), user_id: Faker::Number.within(range: 1..10))
end