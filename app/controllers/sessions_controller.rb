class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password]	)
			session[:user_id] = user.id
			flash[:success] = "Successfully Logged in."
			redirect_to :root
		else
			flash[:danger] = "Login failed."
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
		flash[:info] =  "Logged Out"
	end
end
