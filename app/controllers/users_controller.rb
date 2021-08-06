class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
        @user = User.find_by_id(params[:id])
    end

    def update
        @user = User.find_by_id(params[:id])
        
        if @user.valid?
            @user.update(user_params)
            redirect_to user_reviews_path(current_user.id)
        else
            render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        # redirect_to login_path if !@user
    end

    private
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
    end
end