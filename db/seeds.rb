require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Movie.destroy_all

10.times do
  faker_data = { title: Faker::Movie.title,
                 overview: Faker::Movie.quote,
                 poster_url: Faker::Internet.url,
                 rating: rand(1..10) }
  Movie.create(faker_data)
end

Movie.create(title: "Titanic",
             overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.",
             poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
             rating: 7.9)
Movie.create(title: "Ocean's Eight",
             overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves .",
             poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
             rating: 7.0)

# require "open-uri"

# url = "https://api.github.com/users/ssaunier"
# user_serialized = URI.open(url).read
# user = JSON.parse(user_serialized)

# url = "https://api.github.com/users/ssaunier"
# user_serialized = URI.open(url).read
# user = JSON.parse(user_serialized)
