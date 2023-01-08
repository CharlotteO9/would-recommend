# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Cleaning database..."
User.destroy_all
Membership.destroy_all
Community.destroy_all

puts "Creating 4 users..."

user1 = User.create!(
  username: "Charlotte",
  email: "charlotte@wouldreco.com",
  password: "1234567"
  avatar: "https://images.unsplash.com/photo-1666030931740-adfdd279c5d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1544&q=80",
)

user2 = User.create!(
  username: "Julie",
  email: "julie@wouldreco.com",
  password: "1234567"
  avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
)

user3 = User.create!(
  username: "Marine",
  email: "marine@wouldreco.com",
  password: "1234567"
  avatar: "https://images.unsplash.com/photo-1647642891405-fc8a70cab67f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80",
)

user4 = User.create!(
  username: "Kevin",
  email: "kevin@wouldreco.com",
  password: "1234567"
  avatar: "https://images.unsplash.com/photo-1598155523122-3842334d2c17?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
)

puts "Creating 3 communities..."

community1 = Community.create!(
  name: "Legend-dary group",
  photo: "https://source.unsplash.com/random/?friends,party",
  user: user1,
)

community2 = Community.create!(
  name: "Best friends",
  photo: "https://source.unsplash.com/random/?friends,women",
  user: user2,
)

community3 = Community.create!(
  name: "Fellowship of the ring",
  photo: "https://source.unsplash.com/random/?friends,smile",
  user: user3,
)

puts "Creating many recommendations..."

users = User.all
food = ["food", "meal", "foodie", "dish", "dinner", "vegan", "brunch", "drink"]
book = ["read", "reading", "bookstore", "classic", "novel", "uk", "table", "canada"]

10.times do
  Recommendation.create!(
    category: "restaurant",
    title: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    address: Faker::Address.full_address,
    photo: "https://source.unsplash.com/random/?#{food.sample}",
    user: user.sample
  )
end

10.times do
  Recommendation.create!(
    category: "watch",
    title: Faker::Movie.title,
    description: Faker::Movie.quote,
    user: user.sample
  )
end

10.times do
  Recommendation.create!(
    category: "read",
    title: Faker::Book.title,
    description: "It's a #{Faker::Book.genre} book and it was written by #{Faker::Book.author}",
    user: users.sample
    photo: "https://source.unsplash.com/random/?book-cover,#{book.sample}",
  )
end

10.times do
  Recommendation.create!(
    category: "podcast",
    title: "?????",
    description: "?????",
    user: users.sample
  )
end

10.times do
  Recommendation.create!(
    category: "health",
    title: "?????",
    description: "?????",
    address: Faker::Address.full_address,
    user: users.sample
  )
end

10.times do
  Recommendation.create!(
    category: "shop",
    title: "?????",
    description: "?????",
    address: Faker::Address.full_address,
    user: users.sample
  )
end

puts "Creating many rating..."

recommendations = Recommendation.all

50.times do
  Ratings.create!(
    score: rand(1..5),
    comment: Faker::Restaurant.review,
    recommendation: recommendations.sample,
    user: users.sample,
  )
end

puts "Finished!"
