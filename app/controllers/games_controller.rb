class GamesController < ApplicationController
	include LoginHelper

  def index

    if params[:user_id]
      @user_id = params[:user_id]
      @unsorted_categories = []
      @games = User.find(params[:user_id]).games
      @games.each do |game|
        @unsorted_categories << Category.find(game.category_id)
      end
      @categories = @unsorted_categories.sort_by!{ |name| name }
      @categories.uniq!
    else
      @categories = Category.all.order(:name)
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def add_to_shelf
    @game = Game.find(params[:game_id])
    @user = current_user
    if @user.games.include?(@game)
      redirect_to '/users/#{@user.id}/games'
    else
      @user.games << @game
      @user.save
      redirect_to "/users/#{@user.id}/games"
    end
  end

  def remove_from_shelf
    @game = Game.find(params[:game_id])
    @user = current_user
    if @user.games.include?(@game)
      @user.games.delete(@game)
      @user.save
      redirect_to "/users/#{@user.id}/games"
    else
      redirect_to "/users/#{@user.id}/games"
    end
  end

end
