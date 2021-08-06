class ReviewsController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @reviews = @user.reviews.most_recently_updated
        elsif params[:movie_id]
            @movie = Movie.find_by_id(params[:movie_id])
            @reviews = @movie.reviews.most_recently_updated
        end
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

    def edit
        @review = Review.find_by_id(params[:id])
    end

    def update
        @review = Review.find_by_id(params[:id])
        if @review.valid?
            @review.update(review_params)
            redirect_to user_reviews_path(current_user.id)
        end
    end

    def destroy
        @review = Review.find_by_id(params[:id])
        @review.destroy
        redirect_to movie_path(@review.movie.id)
    end

    private
    
    def review_params
        params.require(:review).permit(:title, :rating, :comment).merge(user_id: current_user.id)
    end
end
