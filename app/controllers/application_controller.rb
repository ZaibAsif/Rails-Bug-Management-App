class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		# binding.pry
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_type])
        # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :user_type) }
        # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :user_type) }
    end
end
