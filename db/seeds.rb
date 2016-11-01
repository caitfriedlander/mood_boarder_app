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

100.times do
    User.create(username: Faker::Internet.user_name, password: 'abc123',
      password_confirmation: 'abc123', email: Faker::Internet.email,
      name: Faker::Name.name, avatar: Faker::Avatar.image("my-own-slug", "50x50"))
end

500.times do
    Board.create(user_id: Faker::Number.between(1, 206), board_title: Faker::Hipster.word)
end
