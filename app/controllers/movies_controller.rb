class MoviesController < ApplicationController
    def index
        # @newest_movies = Movie.newest_releases
        @movie_genres = Movie.alphabetical_genre.select(:genre).distinct
        if params[:genre_name]
            @movies = Movie.where(genre: params[:genre_name])
        elsif params[:search]
            @movies = Movie.where(title: params[:search])
        else
            @newest_movies = Movie.newest_releases
        end
    end

    def show
        @movie = Movie.find_by_id(params[:id])
    end
end
