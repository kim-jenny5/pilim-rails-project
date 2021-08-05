class MoviesController < ApplicationController
    def index
        # @newest_movies = Movie.newest_releases
        @movie_genres = Movie.alphabetical_genre.select(:genre).distinct
        if params[:genre_name]
            @movies = Movie.where(genre: params[:genre_name])
        elsif params[:search]
            @movies = Movie.where('title LIKE ?', "%#{params[:search]}%")
            if @movies.blank?
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

    def new
        @movie = Movie.new
        @movie_genres = Movie.alphabetical_genre.select(:genre).distinct
    end

    def create
        # byebug

        if params[:movie][:new_genre].blank?
            @test = "yeppers"
            @movie = Movie.new(movie_params)

            if @movie.save
                redirect_to movie_path(@movie)
            else
                render :new
            end
        else
            byebug
            @movie = Movie.new(movie_params_new_genre)

        end

        @movie = Movie.new(movie_params)

        if @movie.save
            redirect_to movie_path(@movie)
        else
            render :new
        end
    end

    def show
        @movie = Movie.find_by_id(params[:id])
    end

    private

    def movie_params
        params.require(:movie).permit(:title, :genre, :year)
    end

    def movie_params_new_genre
        params.require(:movie).permit(:title, :new_genre, :year)
    end
end
