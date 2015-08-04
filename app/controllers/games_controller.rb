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
    current_user
    @game = Game.find(params[:id])
  end

end
