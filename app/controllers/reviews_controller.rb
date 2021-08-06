class ReviewsController < ApplicationController
    def index
        @user = User.find_by_id(params[:user_id])
        @reviews = @user.reviews
    end

    def new
        # @user = User.find_by_id(params[:user_id])
        @movie = Movie.find_by_id(params[:movie_id])
        @review = @movie.reviews.build
    end

    def create
        @review = self.new(review_params)

        if @review.save
            # redirect_to 
        end
    end

    private
    
    def review_params
        params.require(:review).permit(:title, :rating, :comment)
    end
end
