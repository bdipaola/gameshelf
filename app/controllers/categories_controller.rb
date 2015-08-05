class CategoriesController < ApplicationController
	def index
	end

	def show
		@category = Category.find(params[:id])
		@categories = Category.all
		@games = Game.where("category_id = #{params[:id]}")
	end

end
