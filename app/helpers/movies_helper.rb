module MoviesHelper
    def star_rating(movie)
        if movie.reviews.count == 0
            "n/a"
        else
            if (movie.reviews.sum(:rating)) == 0
                "n/a"
            else
                ((movie.reviews.sum(:rating).to_f)/(movie.reviews.count)).round(2)
            end
        end
    end
end
