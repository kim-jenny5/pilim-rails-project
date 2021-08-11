module MoviesHelper
    def star_rating(movie)
        movie.reviews.count == 0 ? "n/a" : ((movie.reviews.sum(:rating).to_f)/(movie.reviews.count)).round(2)
    end
end
