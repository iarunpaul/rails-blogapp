class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])

		@comment = @article.comments.build#(comment_params)
		@comment.comment = params[:comment][:comment]
		@comment.user_id = params[:userid]
		if @comment.save
			flash[:success] = "Comment posted."
			redirect_to :back
		else
			flash[:danger] = "Comment not posted."
			redirect_to :back
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		if @comment.destroy
			flash[:warning] = "Comment deleted."
			redirect_to :back
		else
			flash[:danger] = "Couldn't delete comment."
			redirect_to :back
		end
	end

end
