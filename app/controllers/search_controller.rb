class SearchController < ApplicationController

  def index
  end

  def create
    game = Game.where("name like ?", "%#{params[:search]}%").first
    if game
      redirect_to game
    else
      redirect_to search_index_path
    end
  end
end