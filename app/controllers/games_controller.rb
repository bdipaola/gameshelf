class GamesController < ApplicationController
	include LoginHelper

  def index
    if current_user
    		@games = current_user.games
  	else
  		@games = Game.all
  	end
  end

  def show
    current_user
    @game = Game.find(params[:id])
  end

end
