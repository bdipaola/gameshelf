class CategoriesController < ApplicationController

	def index
	end

	def show
		@games = Game.where("category_id = #{params[:id]}")
	end

end
