# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "purging animal images..."
animals = Animal.all

animals.each do |animal|
  animal.image.purge
end

puts 'destroying all users and animals'
Animal.destroy_all
User.destroy_all

puts 'creating 15 users'
5.times do
  user = User.create(
    email: Faker::Internet.email,
    password: 'password',
    username: Faker::Internet.username
  )
  puts "creating user id: #{user.id}"
  3.times do
    animal = Animal.new(
      name: Faker::Name.name,
      specie: Faker::Creature::Animal.name,
      description: Faker::Quote.famous_last_words,
      price: rand(3..15_000),
      origin: ['north america', 'africa', 'europe', 'asia', 'south america', 'antartica', 'oceania'].sample,
      stock: rand(0..25),
      user_id: user.id
    )
    file = URI.open("app/assets/images/gerenuk.jpeg")
    animal.image.attach(io: file, filename: 'gerenuk.jpeg', content_type: 'image/jpeg')
    animal.save
  end
end
puts '15 users with animal created'
