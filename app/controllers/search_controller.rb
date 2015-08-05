class SearchController < ApplicationController
  include SearchHelper

  def index
    @games = game_search(params[:search])
    @users = user_search(params[:search])
    @categories = category_search(params[:search])
    if @games
    else
      redirect_to search_index_path
    end
  end
end