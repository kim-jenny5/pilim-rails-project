class MoviesController < ApplicationController
    def index
        # @movies = Movie.all
        @movies.sort_by_most_reviews
    end

    def show
        @movie = Movie.find_by_id(params[:id])
    end
end
