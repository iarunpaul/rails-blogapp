class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.build(comment_params)
		if @comment.save
			flash[:success] = "Comment posted."
			redirect_to :back
		else
			flash[:danger] = "Comment not posted."
			redirect_to :back
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		if @comment.destroy
			flash[:warning] = "Comment deleted."
			redirect_to @article
		else
			flash[:danger] = "Couldn't delete comment."
			redirect_to article_path(@article)
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :comment)
		end
end
