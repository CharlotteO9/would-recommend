require 'faker'

puts "Cleaning database..."
Community.destroy_all
Membership.destroy_all
User.destroy_all

puts "Creating 14 users..."

user1 = User.create!(
  username: "Charlotte",
  email: "charlotte@wouldreco.com",
  password: "1234567",
  avatar: "https://images.unsplash.com/photo-1666030931740-adfdd279c5d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1544&q=80",
)

user2 = User.create!(
  username: "Julie",
  email: "julie@wouldreco.com",
  password: "1234567",
  avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
)

user3 = User.create!(
  username: "Marine",
  email: "marine@wouldreco.com",
  password: "1234567",
  avatar: "https://images.unsplash.com/photo-1647642891405-fc8a70cab67f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80",
)

user4 = User.create!(
  username: "Kevin",
  email: "kevin@wouldreco.com",
  password: "1234567",
  avatar: "https://images.unsplash.com/photo-1598155523122-3842334d2c17?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
)

avatar = ["man", "women", "hair", "fashion", "smile", "glasses", "nice", "model", "suit", "face", "head"]

10.times do
  User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    avatar: "https://source.unsplash.com/random/?person,#{avatar.sample}"
  )
end

puts "Creating 3 communities..."

community1 = Community.create!(
  name: "Legend-dary group",
  photo: "https://source.unsplash.com/random/?friends,party",
  user_id: user1.id
)

community2 = Community.create!(
  name: "Best friends",
  photo: "https://source.unsplash.com/random/?friends,women",
  user_id: user2.id
)

community3 = Community.create!(
  name: "Fellowship of the ring",
  photo: "https://source.unsplash.com/random/?friends,smile",
  user_id: user3.id
)

puts "Creating memberships..."

users = User.all
communities = Community.all

users.each do |user|
  Membership.create!(
    status: "accepted",
    user_id: user.id,
    community: communities.sample
  )
end

puts "Creating 70 recommendations..."

food = ["food", "meal", "foodie", "dish", "dinner", "vegan", "brunch", "drink", "salad", "cake", "pasta", "healthy"]
book = ["read", "reading", "bookstore", "classic", "novel", "uk", "table", "canada", "cozy", "front-cover", "publish"]
travel = ["monument", "place", "viewpoint", "street", "museum", "walk", "beach", "lake", "ruins", "church", "hiking", "forest"]

10.times do
  Recommendation.create!(
    category: "restaurant",
    title: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    address: Faker::Address.full_address,
    photo: "https://source.unsplash.com/random/?#{food.sample}",
    community_id: users.sample.communities.first.id,
    user_id: users.sample.id
  )
end

10.times do
  Recommendation.create!(
    category: "watch",
    title: Faker::Movie.title,
    description: Faker::Movie.quote,
    community_id: users.sample.communities.first.id,
    user_id: users.sample.id
  )
end

10.times do
  Recommendation.create!(
    category: "read",
    title: Faker::Book.title,
    description: "It's a #{Faker::Book.genre} book and it was written by #{Faker::Book.author}",
    photo: "https://source.unsplash.com/random/?book-cover,#{book.sample}",
    community_id: users.sample.communities.first.id,
    user_id: users.sample.id
  )
end

10.times do
  Recommendation.create!(
    category: "podcast",
    title: Faker::Marketing.buzzwords,
    description: Faker::Hipster.paragraph,
    community_id: users.sample.communities.first.id,
    user_id: users.sample.id
  )
end

10.times do
  Recommendation.create!(
    category: "health",
    title: Faker::TvShows::Friends.character,
    description: "He/She is #{Faker::Science.science}",
    address: Faker::Address.full_address,
    community_id: users.sample.communities.first.id,
    user_id: users.sample.id
  )
end

10.times do
  Recommendation.create!(
    category: "trip",
    title: Faker::Fantasy::Tolkien.location,
    description: "It's a great #{travel.sample}",
    photo: "https://source.unsplash.com/random/?travel,#{travel.sample}",
    address: Faker::Address.full_address,
    community_id: users.sample.communities.first.id,
    user_id: users.sample.id
  )
end

puts "Creating 100 rating..."

recommendations = Recommendation.all

50.times do
  Rating.create!(
    score: rand(1..5),
    comment: Faker::Restaurant.review,
    recommendation: recommendations.sample,
    user_id: users.sample.id
  )
end

50.times do
  Rating.create!(
    score: rand(1..5),
    comment: Faker::TvShows::BrooklynNineNine.quote,
    recommendation: recommendations.sample,
    user_id: users.sample.id
  )
end

puts "Finished!"
