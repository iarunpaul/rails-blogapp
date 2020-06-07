class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
  	if session[:user_id]
		@user ||= User.find(session[:user_id])
	end  
  end

  def authenticate_user

  	redirect_to new_session_path unless current_user
  	
  end

helper_method :current_user
helper_method :authenticate_user

end
