class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :require_login

    def home
        if logged_in?
            redirect_to user_path(current_user)
        end
    end

    private

    def current_user
        @current_user ||= User.friendly.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_login
        unless logged_in?
            flash[:error] = "You must be logged in to access this page."
            redirect_to login_path
        end
    end
end
