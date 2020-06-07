class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password]	)
			session[:user_id] = user.id
			flash[:notice] = "Successfully Logged in."
			redirect_to :root
		else
			flash[:notice] = "Login failed."
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
		flash[:notice] =  "Logged Out"
	end
end
