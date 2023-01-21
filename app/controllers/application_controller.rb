class ApplicationController < ActionController::Base
	def index		
	end
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :password, :password_confirmation])

	    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :name, :email, :password, :remember_me])

	  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :current_password])
	end	
end
