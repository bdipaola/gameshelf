class SearchController < ApplicationController
  include SearchHelper

  def index
    num_players = params[:search].to_i
    if num_players
      @games = player_count_search(num_players)
      @categories = []
      @users = []
    else
      @games = game_search(params[:search])
      @users = user_search(params[:search])
      @categories = category_search(params[:search])
    end
  end
end