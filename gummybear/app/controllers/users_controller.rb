class UsersController < ApplicationController
  include LoginHelper

  def dashboard
    enforce_login(params[:id], "/")
    @games = Game.all
  end

  def show
    @games = Game.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to "/users/#{@user.id}/dashboard"
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :username, :email, :password)
    end
end
