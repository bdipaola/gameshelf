class SearchController < ApplicationController
  include SearchHelper

  def index
  end

  def create
    # game = Game.where("name like ?", "%#{params[:search]}%").first
    games = game_search(params[:search])
    users = user_search(params[:search])
    categories = category_search(params[:search])
    if games
      # redirect_to categories.first
    else
      redirect_to search_index_path
    end
  end
end