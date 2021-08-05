class MoviesController < ApplicationController
    def index
        # @newest_movies = Movie.newest_releases
        @movie_genres = Movie.alphabetical_genre.select(:genre).distinct
        if params[:genre_name]
            @movies = Movie.where(genre: params[:genre_name])
        elsif params[:search]
            @movies = Movie.where('title LIKE ?', "%#{params[:search]}%")
            if @movies.empty?
                @newest_movies = Movie.newest_releases
                flash[:message] = "'#{params[:search]}' not found."
                redirect_to movies_path
            else
                render :index
            end
        else
            @newest_movies = Movie.newest_releases
        end
    end

    def show
        @movie = Movie.find_by_id(params[:id])
    end
end
