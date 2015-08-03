class UsersController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @games = Game.all
  end

end
