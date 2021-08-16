class MoviesController < ApplicationController
    before_action :require_login, except: [:index, :show]
    include MoviesHelper

    def index
        @movie_genres = Movie.distinct_alphabetized_genre

        if params[:genre_name]
            @movies = Movie.filtered_by_genre(params[:genre_name])
        elsif params[:search]
            @movies = Movie.movie_search(params[:search])
            if @movies.blank?
                @newest_movies = Movie.newest_releases
                flash[:message] = "'#{params[:search]}' is not found."
                redirect_to movies_path
            else
                render :index
            end
        else
            @newest_movies = Movie.newest_releases
        end
    end

    def new
        @movie = Movie.new
        @movie_genres = Movie.distinct_alphabetized_genre
    end

    def create
        @movie = Movie.new(movie_params)
        @movie_genres = Movie.distinct_alphabetized_genre

        if @movie.save
            redirect_to movie_path(@movie)
        else
            render :new
        end
    end

    def show
        @movie = Movie.friendly.find(params[:id])
        @reviews = @movie.reviews.top_ten_recently_updated
    end

    private

    def movie_params
        params.require(:movie).permit(:title, :genre, :year)
    end
end
