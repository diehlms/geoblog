class SessionsController < ApplicationController

    helper_method :logged_in?, :current_user
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user #&& user.authenticate(params[:session][:password])
        #     if user.email_confirmed
        #         session[:user_id] = user.id
        #         flash[:success] = "Logged in"
        #         redirect_to articles_path
        #     else
        #         flash[:error] = "Please activate your account"
        #         render 'new'
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:error] = "Invalid email/password combination"
            render 'new'
        end
    end

    def destroy
        session.delete(:user_id)
        @current_user = nil
        redirect_to root_url
    end

end
