class ArticlesController < ApplicationController
	before_action :authenticate_user, only: [:edit, :new, :create, :update, :destroy]
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

		@article = Article.new(@a)
		if @article.save
			flash[:success] = "article created."
			redirect_to @article
		else
			flash[:danger]  = "error occured."
			render "new"
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:success] = "article updated."
			redirect_to :root
		else
			flash[:danger] = "error occured."
			render "edit"
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:warning] = "article #{params[:id]} deleted."
		redirect_to :root
	end

	def mercury_update
		article = Article.find(params[:id])
		# ...
		render text: ""
	end

	private
		def article_params
			params.require(:article).permit(:title, :content)
		end

end