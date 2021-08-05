class SessionsController < ApplicationController    
    def new
       @user = User.new 
    end

    def create
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def destroy
        reset_session
        redirect_to login_path
    end

    def google_omniauth
        @user = User.find_or_create_by(uid: google_auth[:uid], provider: google_auth[:provider]) do |u|
            u.first_name = google_auth[:info][:first_name]
            u.last_name = google_auth[:info][:last_name]
            u.username = google_auth[:info][:email].split("@").first
            u.email = google_auth[:info][:email]
            u.avatar = google_auth[:info][:image]
            u.password = SecureRandom.hex(15)
        end
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to login_path
        end
    end

    private

    def google_auth
        request.env['omniauth.auth']
    end
end
