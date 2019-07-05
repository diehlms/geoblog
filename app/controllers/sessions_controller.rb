class SessionsController < ApplicationController

    helper_method :logged_in?, :current_user
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            if user.email_confirmed
                session[:user_id] = user.id
                redirect_to articles_path, notice: "Logged in"
            else
                render 'new', notice: "Please activate your account"
            end
        else
            render 'new', notice: "Invalid email/password combination"
        end
    end

    def destroy
        session.delete(:user_id)
        @current_user = nil
        redirect_to root_url
    end

end
