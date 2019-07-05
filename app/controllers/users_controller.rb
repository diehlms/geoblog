class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]
    helper_method :logged_in?, :current_user

    def new
        @user = User.new
    end

    def show
    end

    def index
        @users = User.all
    end

    def create
        @user = User.new(user_params)
        if @user.save
            UserMailer.registration_confirmation(@user).deliver
            redirect_to root_url, success: "Please confirm your email address to continue"
        else
            redirect_to root_url, notice: "Something went wrong. Please try again or contact us for support."
        end
    end

    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to @user, notice: "User was successfully updated" }
                format.json { render :show, status: :ok, location: @user }
            else
                format.html { render :edit }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit
    end

    def destroy
        @user.destroy
        respond_to do |format|
            format.html { redirect_to users_url, notice: "User successfully destroy" }
            format.json { head :no_content }
        end
    end

    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
            user.email_activate
            flash[:success] = "Welcome to the Geoblog"
            redirect_to root_url
        else
            flash[:error] = "Sorry, user does not exist"
            redirect_to root_url
        end
    end

    private

        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation)
        end
    end