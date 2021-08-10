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
            flash[:message] = "Incorrect email or password."
            render :new
        end
    end

    def destroy
        reset_session
        redirect_to login_path
        # flash[:message] = "Bye bye! 👋🏻"
    end

    def google_omniauth
        @user = User.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u|
            u.first_name = auth[:info][:first_name]
            u.last_name = auth[:info][:last_name]
            u.username = auth[:info][:email].split("@").first
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(15)
        end
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to login_path
        end
    end

    def facebook_omniauth
        @user = User.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u|
            u.first_name = auth[:info][:name].split(" ").first
            u.last_name = auth[:info][:name].split(" ").last
            u.username = auth[:info][:email].split("@").first
            u.email = auth[:info][:email]
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

    def auth
        request.env['omniauth.auth']
    end
end
