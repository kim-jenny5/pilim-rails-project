class ReviewsController < ApplicationController
    def index
        @user = User.find_by_id(params[:user_id])
        @reviews = @user.reviews
    end
end
