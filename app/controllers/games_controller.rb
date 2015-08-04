class GamesController < ApplicationController
	include LoginHelper

  def index
    if authorized(params[:user_id])
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
