class LoginController < ApplicationController
  include LoginHelper
  def new
    render "login/_new.html.erb"
  end

  def create
    @user = find_user(params[:username])
    if @user and @user.authenticate(params[:password])
      login(@user)
      redirect_to "/users/#{@user.id}/dashboard"
    else
      redirect_to new_login_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
