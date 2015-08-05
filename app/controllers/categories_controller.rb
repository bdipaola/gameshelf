class CategoriesController < ApplicationController
	# probably not the best way to fix ActionController::InvalidAuthenticityToken bug, but it works...
	protect_from_forgery with: :null_session
	def index
	end

	def show
		@categories = Category.all
		@games = Game.where("category_id = #{params[:id]}")
	end

end
