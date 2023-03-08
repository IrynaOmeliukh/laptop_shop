# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Laptop.destroy_all

1000.times do
  Laptop.create!(
    company: Faker::Company.name,
    model: Faker::Device.model_name,
    price: Faker::Number.between(from: 5000.00, to: 25000.00),
    year: Faker::Number.between(from: 2010, to: 2023)
  )
end

puts 'complete'
