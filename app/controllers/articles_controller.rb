class ArticlesController < ApplicationController
	before_action :authenticate_user, only: [:new, :create, :mercury_update, :destroy]
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
		# We are commenting the form creation of articles to make use of
		# Mercury editing
		@article = Article.new#(article_params)//we don't use any mass assignment
		@article.title = params[:article][:title]
		@article.content = "Please click edit and start posting..."
		if @article.save
			flash[:success] = "article created."
			redirect_to @article
		else
			flash[:danger]  = "error occured."
			render "new"
		end
	end

	# def edit
		# @article = Article.find(params[:id])
	# end

	# def update
		# @article = Article.find(params[:id])
		# if @article.update(article_params)
			# flash[:success] = "article updated."
			# redirect_to :root
		# else
			# flash[:danger] = "error occured."
			# render "edit"
		# end
	# end

	def mercury_update
	  article = Article.find(params[:id])
	  article.title = params[:content][:title][:value]
	  article.content = params[:content][:content][:value]
	  if article.save!
	  	render plain: ""
	  	flash[:success] = "article updated by Mercury editor."
	  else
			flash[:danger] = "error occured."
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:warning] = "article #{params[:id]} deleted."
		redirect_to :root
	end

	# We don't use any mass assignment using Mercury editor
	# private
		# def article_params
			# params.require(:article).permit(:title, :content)
		# end

end