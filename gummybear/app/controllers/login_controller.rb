class LoginController < ApplicationController

    def new
    end

    def create
      @user = User.find_by(username: params[:username])
      if @user and @user.authenticate(params[:password])
        login(@user)
        redirect_to @user
      else
        redirect_to new_login_path
      end
    end

    def destroy
      logout
      redirect_to root
    end
end