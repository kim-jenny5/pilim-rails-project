class MoviesController < ApplicationController
    def index
        # @movies = Movie.all
        # @movies = Movie.sort_by_most_reviews
        @movies = Movie.newest_releases
        # @movies = Movie.joins(:reviews).group("reviews.movie_id").order("count(reviews.movie_id) DESC")
        # @movies = Movie.joins(:reviews).group("movie.id").order("count(movie.id) DESC")
    end

    def show
        @movie = Movie.find_by_id(params[:id])
    end
end
