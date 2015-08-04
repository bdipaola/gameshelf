
class GamesController < ApplicationController
	include LoginHelper

  def index
  	if authorized(params[:user_id])
  		puts"working"
    	p current_user.games
	else
		@games = Game.all
	end
  end

  def show
    @game = Game.find(params[:id])
  end

end
