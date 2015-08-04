class GamesController < ApplicationController
	include LoginHelper

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

end
