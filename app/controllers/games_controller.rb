class GamesController < ApplicationController
	include LoginHelper

  def index
    if params[:user_id]
      @categories = Category.all
      @games = User.find(params[:user_id]).games
    else
      @categories = Category.all
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
  end

end
