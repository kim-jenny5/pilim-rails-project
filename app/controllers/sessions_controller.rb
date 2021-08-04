class SessionsController < ApplicationController
    def new
       @user = User.new 
    end

    def create
        if @user = User.find_by_username(params[:username])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end

    def destroy
        reset_session
    end
end
