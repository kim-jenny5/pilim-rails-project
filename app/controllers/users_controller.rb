class UsersController < ApplicationController
    # skip_before_action :require_login, only: [:show]
    before_action :require_login, except: :show

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
            if @user.update(user_params)
                redirect_to user_path(current_user.id)
            else
                render :edit
            end
        else
            render :edit
        end
    end

    def show
        # if logged_in?
            @user = User.find_by_id(params[:id])
        # else
        #     redirect_to login_path
        # end
    end

    private
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
    end
end