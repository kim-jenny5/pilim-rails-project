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

black_widow = Movie.create!(title: "Black Widow", genre: "Superhero", year: "2021")
assassination = Movie.create!(title: "Assassination", genre: "Action", year: "2015")
your_name = Movie.create!(title: "Your Name", genre: "Romance", year: "2016")
miracle_cell = Movie.create!(title: "Miracle in Cell No. 7", genre: "Dramedy", year: "2013")
incredibles_two = Movie.create!(title: "The Incredibles 2", genre: "Family", year: "2018")
lion_king = Movie.create!(title: "The Lion King", genre: "Family", year: "1994")
little_women = Movie.create!(title: "Little Women", genre: "Drama", year: "2019")
twilight = Movie.create!(title: "Twilight", genre: "Romance", year: "2008")

marvel = [
    ["Avengers: Endgame", "Superhero", "2019"],
    ["Guardians of the Galaxy", "Superhero", "2014"],
    ["Ant-Man", "Superhero", "2015"],
    ["Spider-Man: Homecoming", "Superhero", "2017"],
    ["Black Panther", "Superhero", "2018"]
]

marvel.each do |title, genre, year|
    Movie.create!(title: title, genre: genre, year: year)
end

korean = [
    ["The Host", "Monster", "2006"],
    ["The Thieves", "Heist", "2012"],
    ["Oldboy", "Thriller", "2003"],
    ["Extreme Job", "Action-Comedy", "2019"],
    ["Train to Busan", "Action-Horror", "2016"]
]

korean.each do |title, genre, year|
    Movie.create!(title: title, genre: genre, year: year)
end

romance = [
    ["The Notebook", "Romance", "2004"],
    ["La La Land", "Romance", "2016"],
    ["Titanic", "Romance", "1997"],
    ["Pride and Prejudice", "Drama", "2005"],
    ["Sound of Music", "Musical", "1965"]
]

romance.each do |title, genre, year|
    Movie.create!(title: title, genre: genre, year: year)
end

family = [
    ["Toy Story", "Family", "1995"],
    ["Toy Story 2", "Family", "1999"],
    ["Toy Story 3", "Family", "2010"],
    ["The Incredibles", "Family", "2004"],
    ["Ratatouille", "Family", "2007"],
    ["Monsters, Inc.", "Family", "2001"],
    ["Tangled", "Family", "2010"],
    ["Zootopia", "Family", "2016"]
]

family.each do |title, genre, year|
    Movie.create!(title: title, genre: genre, year: year)
end

anime = [
    ["Princess Mononoke", "Fantasy", "1997"],
    ["Howl's Moving Castle", "Fantasy", "2004"],
    ["Spirited Away", "Fantasy", "2001"],
    ["5 Centimeters per Second", "Romance", "2007"]
]

anime.each do |title, genre, year|
    Movie.create!(title: title, genre: genre, year: year)
end
