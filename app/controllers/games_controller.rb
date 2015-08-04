class GamesController < ApplicationController
	include LoginHelper

  def index
    if params[:user_id]
      puts "Test"
      @games = User.find(params[:user_id]).games
      p @games
    else
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
  end

end
