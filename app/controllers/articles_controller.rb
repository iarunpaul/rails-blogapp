class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end
	
	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
	end

	def new
		@article = Article.new
	end

	def create		
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "article created."
			redirect_to @article
		else
			flash[:notice]  = "error occured."
			render "new"
		end	
	end

	def edit
		@article = Article.find(params[:id])
	end
	
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "article updated."
			redirect_to :root
		else
			flash[:notice] = "error occured."
			render "edit"
		end		
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "article #{params[:id]} deleted."
		redirect_to :root
	end	

	private
		def article_params
			params.require(:article).permit(:title, :content)
		end	

end	