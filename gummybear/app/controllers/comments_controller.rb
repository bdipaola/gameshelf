class CommentsController < ApplicationController
	
	def new
		@game = Game.find(params[:game_id])
	end
	
	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			redirect_to "/games/#{:game_id}"
		else
			render 'new'
		end 
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end

end