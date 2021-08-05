class MoviesController < ApplicationController
    def index
        @newest_movies = Movie.newest_releases
        @movie_genres = Movie.alphabetical_genre.select(:genre).distinct

        
    end

    def show
        @movie = Movie.find_by_id(params[:id])
    end
end
