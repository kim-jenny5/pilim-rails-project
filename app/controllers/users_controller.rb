class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create, :show]
    before_action :find_user, except: [:new, :create]
    before_action :not_authorized, only: [:edit, :update]

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
    end 

    def edit
    end

    def update
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

    def find_user
        @user = User.friendly.find_by_username(params[:id])
    end

    def not_authorized
        if @user != current_user
            flash[:message] = "Sorry. You are not authorized to access this page."
            redirect_to user_path(current_user)
        end
    end    
end