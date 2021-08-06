class ReviewsController < ApplicationController
    def index
        @user = User.find_by_id(params[:user_id])
        @reviews = @user.reviews
    end

    def new
        # @user = User.find_by_id(params[:user_id])
        @movie = Movie.find_by_id(params[:movie_id])
        # @review = @movie.reviews.build
        @review = Review.new
        # byebug
    end

    def create
        @movie = Movie.find_by_id(params[:movie_id])
        @review = @movie.reviews.build(review_params)
        # @review = self.new(review_params)
        if @review.save
            redirect_to movie_path(@review.movie.id)
        end
    end

    private
    
    def review_params
        params.require(:review).permit(:title, :rating, :comment).merge(user_id: current_user.id)
    end
end
