class ReviewsController < ApplicationController
    def index
        @user = User.find_by_id(params[:user_id])
        @reviews = @user.reviews
    end

    def new
        # @user = User.find_by_id(params[:user_id])
        @movie = Movie.find_by_id(params[:movie_id])
        @review = Review.new 
    end

    def create
    end
end
