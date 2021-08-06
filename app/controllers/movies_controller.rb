class MoviesController < ApplicationController
    helper_method :star_rating

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
        @movie = Movie.new(movie_params)

        if @movie.save
            redirect_to movie_path(@movie)
        else
            render :new
        end
    end

    def show
        @movie = Movie.find_by_id(params[:id])
        # @movie_rating = star_rating(@movie)
        # @movie.reviews.order(updated_at: :desc)
    end

    #not necessary
    # def edit
    #     @movie = Movie.find_by_id(params[:id])
    #     @movie_genres = Movie.alphabetical_genre.select(:genre).distinct
    # end

    def update

    end

    private

    def movie_params
        params.require(:movie).permit(:title, :genre, :year)
    end

    def star_rating(movie)
        ((movie.reviews.sum(:rating).to_f)/(movie.reviews.count)).round(2)
    end
end
