class SessionsController < ApplicationController    
    def new
       @user = User.new 
    end

    def create
        if @user = User.find_by_email(params[:email])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end
end
