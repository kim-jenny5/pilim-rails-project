# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = [
    ["Jenny", "Kim", "jennyjellybeans", "kimj1905@gmail.com", "1234"],
    ["Florence", "Pugh", "florencepugh", "florencepugh@gmail.com", "florence"],
    ["Woody", "Pride", "woodynandy4ever", "woodynandy4ever@gmail.com", "andy"]
]

users.each do |first_name, last_name, username, email, password|
    User.create!(first_name: first_name, last_name: last_name, username: username, email: email, password: password)
end