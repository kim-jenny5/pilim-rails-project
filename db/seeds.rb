# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#--------------------------------------------------- Users
users = [
    ["Jenny", "Kim", "jennyjellybeans", "kimj1905@gmail.com", "1234"],
    ["Florence", "Pugh", "florencepugh", "florencepugh@gmail.com", "florence"],
    ["Woody", "Pride", "woodynandy4ever", "woodynandy4ever@gmail.com", "andy"]
]

users.each do |first_name, last_name, username, email, password|
    User.create!(first_name: first_name, last_name: last_name, username: username, email: email, password: password)
end

#--------------------------------------------------- Movies

marvel = [
    ["Black Widow", "Superhero", "2021"], #1
    ["Avengers: Endgame", "Superhero", "2019"], #2
    ["Guardians of the Galaxy", "Superhero", "2014"], #3
    ["Ant-Man", "Superhero", "2015"], #4
    ["Spider-Man: Homecoming", "Superhero", "2017"], #5
    ["Black Panther", "Superhero", "2018"] #6
]

marvel.each do |title, genre, year|
    marvel_movies = Movie.create!(title: title, genre: genre, year: year)
end

korean = [
    ["Assasination", "Action", "2015"], #7
    ["Miracle in Cell No. 7", "Dramedy", "2013"], #8
    ["The Host", "Monster", "2006"], #9
    ["The Thieves", "Heist", "2012"], #10
    ["Oldboy", "Thriller", "2003"], #11
    ["Extreme Job", "Action-Comedy", "2019"], #12
    ["Train to Busan", "Action-Horror", "2016"] #13
]

korean.each do |title, genre, year|
    Movie.create!(title: title, genre: genre, year: year)
end

romance = [
    ["The Little Women", "Drama", "2019"], #14
    ["Twilight", "Romance", "2008"], #15
    ["The Notebook", "Romance", "2004"], #16
    ["La La Land", "Romance", "2016"], #17
    ["Titanic", "Romance", "1997"], #18
    ["Pride and Prejudice", "Drama", "2005"], #19
    ["Sound of Music", "Musical", "1965"] #20
]

romance.each do |title, genre, year|
    Movie.create!(title: title, genre: genre, year: year)
end

family = [
    ["Toy Story", "Family", "1995"], #21
    ["Toy Story 2", "Family", "1999"], #22
    ["Toy Story 3", "Family", "2010"], #23
    ["The Incredibles", "Family", "2004"], #24
    ["The Incredibles 2", "Family", "2018"], #25
    ["The Lion King", "Family", "1994"], #26
    ["Ratatouille", "Family", "2007"], #27
    ["Monsters, Inc.", "Family", "2001"], #28
    ["Tangled", "Family", "2010"], #20
    ["Zootopia", "Family", "2016"] #30
]

family.each do |title, genre, year|
    Movie.create!(title: title, genre: genre, year: year)
end

anime = [
    ["Your Name", "Romance", "2016"], #31
    ["Princess Mononoke", "Fantasy", "1997"], #32
    ["Howl's Moving Castle", "Fantasy", "2004"], #33
    ["Spirited Away", "Fantasy", "2001"], #34
    ["5 Centimeters per Second", "Romance", "2007"] #35
]

anime.each do |title, genre, year|
    Movie.create!(title: title, genre: genre, year: year)
end

#--------------------------------------------------- Lists

lists = [
    [1, "Movies to watch for a broken heart 💔", "Cheer up girls (and boys). Grab that pint (or quart) of chocolate ice cream 🍫+🍦 and soothe your hearts with these movies! Love comes around (even if it comes in 2D forms). 💕"], #hearbreak
    [1, "Throwback to my childhood 🧒🏻", "Oh the good old days when the biggest worry of the week was which Disney movie to watch 😩"], #childhood
    [1, "When you want to travel to Japan 🇯🇵 but #poor", "Stay safe everyone and vicariously travel to Japan 🌸 through these select movies!"], #anime
    [1, "Memories with Mom 💗", "Movies I used to (still watch!) with my mom. We're big musical fans! 🎤"], #mom
    [1, "AVENGERS ASSEMBLE!!!", "My favorite Marvel movies. 🥰 Does anyone else miss Marvel? Sh*t hit the fan after COVID 🥲"], #marvel
    [1, "Exciting movies for your Seoul (Gong Yoo doe 👀)", "Get your daily dose of vitamin K 🇰🇷 here!! All these movies are so good OMG!"], #korean
    [2, "Look Ma! It's Me!", "Not to brag but I'm a pretty big star now. 💁🏻‍♀️ All the movies I've featured in."], #florence
    [2, "My guilty pleasure movies 🙊🙈", "And yes, Twilight is included here 😂"], #guilty_pleasures
    [2, "Epic Period movies!!", "Watch these guys if you want to travel back in time #cottagecore 🍃💐"], #period
    [3, "Yeehaw! 🤠 Family-friendly movies only for this cowboy.", "The Sheriff's in town boys. Yes, these movies are animated, but they'll keep you ON EDGE Y'ALL! 🙀"], #family
    [3, "Giddy-up, partner! We're headed to the wild, wild East.", "I've never been to the East (since I'm a western cowboy 🤠) but 'reach for the sky'! These animated movies from Japan are as good as playing with Andy."] #japanese
]

lists.each do |user_id, title, description|
    List.create!(user_id: user_id, title: title, description: description)
end

List.find(1) << Movie.find()
List.find(5) << marvel_movies

#--------------------------------------------------- Reviews

reviews = [
    [1, 1, "Lived up to its expectations! But I already knew her fate so...", 4, "This movie was great! This was my second movie I watched in theaters after COVID and I thoroughly enjoyed the whole experience. The only reason I'm giving this movie 4 stars is because we all already know what would happen to Natasha... The movie was good, but I just wish that Marvel released this movie sooner. But then again, I wonder if this movie would have been received as well as it's doing now because of its emphasis on the female characters. Overall, super glad for ScarJo that she got her own movie!"],
    [1, 7, "GREAT acting from all the actors!", 5, "I consistently rewatch this movie every year or so. It's THAT good! Gianna Jun's performance (mind you, she was a couple months pregnant shooting the film) is impeccable and this movie threw me into a rabbit hole of researching Korea's history. The filmography itself was beautifully done as well. No other words for this movie, except for more applauds! 👏🏻👏🏻👏🏻👏🏻"],
    [1, 31, "Albeit a bit confusing, the illustration was stunning 😵", 4, "This is a MUST watch for everyone! Even as a Japanese minor, there were moments here and there that were confusing, so I'm sure the average non-Japanese had to look stuff up on Google upon watching it. But when I tell you the illustration is beautiful, it is bee-yoo-ti-ful. The movie constantly keeps you on your toes and just as you think you understand where the movie's taking you, it says 'NOPE!' and takes you to somewhere completely different. Best Makoto Shinkai's work yet!"],
    [1, 8, "You will laugh then cry then laugh and cry again. You've been warned.", 5, "First off: you'll cry buckets. This movie made me SOB. Ryu Seung-ryong's acting is just insanely amazing as he portrays a mentally disabled man (has a brain of a 6-year old) who just loves and wants to live peacefully with his 6-year old daughter, Ye-Sung, but... Overall, this movie is able to portray both the good and bad in humanity, in a way you end up rooting for the lovable misfits."],
    [1, 25, "Was a bit predictable but a good reversal of gender stereotypes.", 4, "Like the title states, the movie was a bit predictable (in that I quickly predicted who the villain was), but I enjoyed the reversal of Mr. Incredible and Elastigirl's roles in this movie. Mr. Incredible took a back seat in this movie as Elastigirl shone through, showing kickass girl power. They also, for some reason, made her thicccccc but no complaints here!"],
    [1, 26, "💯!!", 5, "This movie really doesn't need an explanation. It's an eternal classic. As a kid I just enjoyed the songs and the movie's bright colors, but as an adult I enjoyed just about everything. The family politics is so much more complex than I remembered. It just makes me wonder: if Mufasa and Scar's parents just raised them equally, will this have been a movie at all? Hahaha #showerthoughts."],
    [2, 1, "A m a z i n g", 5, "Well what can I say? I'm in it, so of course it's amazing haha. I'd like to think that I was the scene stealer of this movie 😎 By the way, did you all catch the ending of the movie? 👀 Buckle up lads. Hawkeye's going to be a ride."],
    [2, 14, "Another scene stealer for me I guessssss", 5, "Saoirse who? No one likes Amy, but people say I was able to bring her alive 😎💁🏻‍♀️. I swear I'm like way too good at my job. But in all honesty, whether you're going to watch it for me, or for Saoirse or Emma (or Meryl Streep), just go watch it. The movie got nominated for 6 Academy Awards and it won for costume design! Even if you don't like any of the actors (🥲), go watch it for the fashion 👗."],
    [2, 25, "The wait was worth it.", 5, "Being 25 now, I was 8 when the first movie came out so of course I was excited when the second one finally came out, since it was like revisiting my childhood. But the movie did not disappoint! I think it was great that they showed Elastigirl and her talents more in this movie, considering she really didn't play a role in the first one. I think it's also really interesting to see the differences between the two movies, since both were released in completely different, politically and culturally, worlds. If you haven't yet seen the movie, WHY NOT? This is your call to go watch it!"],
    [2, 15, "Ermmmm...", 2, "This movie really doesn't need more explaining. The only thing I hate more than this movie is how I hate that I can't take my eyes off the screen. 😂 It's like a car crash!"],
    [3, 25, "Other than Toy Story, best Pixar series!", 5, "Nothing beats Toy Story (I would know of course 🤠) but Incredibles 2 really tried to challenge Toy Story's seat for the best Pixar movie series. As a professional children's toy, I think they really portrayed the Parr children very accurately as to how children their age act in real life. Violet--a teenager--just wants to be invisible, a symptom of her insecurities, and gets visibly fired up when 'teenage stuff' happens (and boy I've seen it all, especially with Andy). Dash on the other hand is just his lovable, mischievious self, displaying classic personality traits of boys his age. Another win for Pixar!"],
    [3, 26, "BEST DISNEY MOVIE! EVER!", 5, "Now, note that I said best DISNEY movie. Toy Story is still the best PIXAR movie. But going back to The Lion King, you want drama? It has it. You want murder? It has it. You want love? IT HAS IT!! This movie is a complete package. I love seeing Simba grow up from his immature self to a righteous king, retaking the Pride Lands from his murderous uncle. This movie will never get old. Never."],
]

reviews.each do |user_id, movie_id, title, rating, comment|
    Review.create!(user_id: user_id, movie_id: movie_id, title: title, rating: rating, comment: comment)
end