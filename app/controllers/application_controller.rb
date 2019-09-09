class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    def current_cart
      if user_signed_in?
        @cart = current_user.cart
      else
        if session[:cart]
          @cart = Cart.find(session[:cart])
        else
          @cart = Cart.create
          session[:cart] = @cart.id
        end
      end
    end

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :lname])
    end
end
