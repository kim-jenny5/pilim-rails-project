class MoviesController < ApplicationController
    def show
        @movie = Movie.find_by_id(params[:id])
    end
end
