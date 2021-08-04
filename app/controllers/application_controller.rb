class ApplicationController < ActionController::Base
    helper_method :current_user

    def home
    end

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
end
