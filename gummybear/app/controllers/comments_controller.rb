class CommentsController < ApplicationController
	include LoginHelper

	def new
		@comment = Comment.new
		@game = Game.find(params[:game_id])
	end
	
	def create
		@game = Game.find(params[:game_id])
		@comment = Comment.new(comment_params)
		@comment.update(user: current_user)
		if @comment.save
			redirect_to "/games/#{@game.id}"
		else
			render 'new'
		end 
	end
	
	def edit
		@game = Game.find(params[:game_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@game = Game.find(params[:game_id])
		@comment = Comment.find(params[:id])
		@comment.assign_attributes(comment_params)
		if @comment.save
			redirect_to "/games/#{@game.id}"
		else
			render 'edit'
		end
	end

	def destroy
		game = Game.find(params[:game_id]) 
		comment = Comment.find(params[:id])
		comment.destroy
		if comment.destroyed?
			redirect_to "/games/#{game.id}"
		else
			render "games/show"
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:content, :game_id)
	end

end