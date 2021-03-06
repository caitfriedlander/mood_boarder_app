# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Board.destroy_all
Image.destroy_all

User.create(username: "Cait1", password: 'abc123',
      password_confirmation: 'abc123', email: "cati@cait.com",
      name: "Cait")

100.times do
    User.create(username: Faker::Internet.user_name, password: 'abc123',
      password_confirmation: 'abc123', email: Faker::Internet.email,
      name: Faker::Name.name)
end

500.times do
    Board.create(user_id: Faker::Number.between(1, 305), title: Faker::Hipster.word, description: Faker::Hipster.sentences(1))
end
