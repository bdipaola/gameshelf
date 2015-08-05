class GamesController < ApplicationController
	include LoginHelper

  def index
    if params[:user_id]
      @games = User.find(params[:user_id]).games
    else
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def add_to_shelf
    @game = Game.find(params[:game_id])
    @user = current_user
    if @user.games.include?(@game)
      render 'show'
    else
      @user.games << @game
      redirect_to "show"
    end
  end

  def remove_from_shelf
    @game = Game.find(params[:game_id])
    @user = current_user
    if @user.games.include?(@game)
      @user.games.delete(@game)
      redirect_to "/users/#{user.id}/games"
    else
      redirect_to "/users/#{user.id}/games"
    end
  end

end
