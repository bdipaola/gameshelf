class UsersController < ApplicationController
  include LoginHelper

  def dashboard
    enforce_login(params[:id], "/")
    @user = User.find(params[:id])
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_update_params)
      redirect_to "/users/#{@user.id}/dashboard"
    else
      render :update
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :username, :email, :password)
    end

    def user_update_params
      params.require(:user).permit(:name, :username, :email)
    end
end
