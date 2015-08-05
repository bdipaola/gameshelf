class UsersController < ApplicationController
  include LoginHelper
  include SearchHelper
  include FriendImgHelper

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

  def friends
    @friends = (User.find(params[:id])).friends
  end

  def add_friend
    @friend = User.find_by(add_friend_params)
    @user = User.find(params[:id])
    if @friend
      current_user.friends << @friend
      current_user.save
      redirect_to "/users/#{current_user.id}/friends"
    else
      render "dashboard"
    end
  end

  def remove_friend
    friend = User.find(params[:friend][:friend_id])
    current_user.friends.delete(friend)
    if current_user.friends.include?(friend)
      render "/users/#{current_user.id}/friends"
    else
      current_user.save
      redirect_to "/users/#{current_user.id}/friends"
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :username, :email, :password)
    end

    def user_update_params
      params.require(:user).permit(:name, :username, :email)
    end

    def add_friend_params
      params.require(:user).permit(:username)
    end
end
