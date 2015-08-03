class UsersController < ApplicationController

  def dashboard
  end
  
  def index
    @games = Game.all
  end

  def show
    @games = Game.all
  end

end
