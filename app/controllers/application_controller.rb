class ApplicationController < ActionController::Base
  include Authentication

    protect_from_forgery with: :exception

    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :admin?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :lname])
    end
end
