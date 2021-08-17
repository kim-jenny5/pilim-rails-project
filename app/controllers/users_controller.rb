class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create, :show]

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

    def show
        @user = User.friendly.find_by_username(params[:id])
    end 

    def edit
        @user = User.friendly.find_by_username(params[:id])
    end

    def update
        @user = User.friendly.find_by_username(params[:id])

        if @user.valid?
            if @user.update(user_params)
                redirect_to user_path(@user)
            else
                render :edit
            end
        else
            render :edit
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
    end
end