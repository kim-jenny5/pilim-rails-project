class ReviewsController < ApplicationController
    before_action :require_login, except: :index
    before_action :find_review, only: [:edit, :update, :destroy]

    def index
        if params[:user_id]
            @user = User.friendly.find_by_username(params[:user_id])
            @reviews = @user.reviews.most_recently_updated
        elsif params[:movie_id]
            @movie = Movie.friendly.find(params[:movie_id])
            @reviews = @movie.reviews.most_recently_updated
        end
    end

    def new
        @movie = Movie.friendly.find(params[:movie_id])
        @review = Review.new
    end

    def create
        @movie = Movie.friendly.find(params[:movie_id])
        @review = @movie.reviews.build(review_params)

        if @review.save
            redirect_to movie_path(@movie)
        end
    end

    def edit
        # @review = Review.find_by_id(params[:id])
    end

    def update
        # @review = Review.find_by_id(params[:id])

        if @review.valid?
            @review.update(review_params)
            redirect_to movie_path(@review.movie)
        end
    end

    def destroy
        # @review = Review.find_by_id(params[:id])
        @review.destroy
        redirect_to movie_path(@review.movie)
    end

    private
    
    def review_params
        params.require(:review).permit(:title, :rating, :comment).merge(user_id: current_user.id)
    end

    def find_review
        @review = Review.find_by_id(params[:id])
    end

    def not_authorized
        if @review.user != current_user
            flash[:message] = "Sorry. You are not authorized to access this page."
            redirect_to user_path(current_user)
        end
    end
end
