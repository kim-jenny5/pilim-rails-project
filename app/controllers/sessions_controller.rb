class SessionsController < ApplicationController
    def home
    end
    
    def new
       @user = User.new 
    end

    def create
        if @user = User.find_by_username(params[:user][:username])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        # else
        #     redirect_to login_path something like this
        end
    end

    def destroy
        reset_session
    end
end
