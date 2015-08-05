class CategoriesController < ApplicationController
	include LoginHelper
	def index
	end

	def show
		if params[:user_id]
			@category = Category.find(params[:id])
			@categories = Category.all.order(:name).uniq
			@games = current_user.games.select do |game|
				game.category == @category
			end
		else
			@categories = Category.all.order(:name).uniq
			@category = Category.find(params[:id])
			@games = Game.all.select do |game|
				game.category == @category
			end
		end
	end

end
