# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?
  include Authentication
  include ApiFilters

  before_action :current_cart

  def store_requested_path
    session[:requested_path] = request.fullpath unless current_user
  end

  private
  
  def current_cart
    if logged_in?
      @current_cart = Cart.find_or_create_by(user: current_user)
    else
      if session[:cart]
        @current_cart = Cart.find(session[:cart])
      else
        @current_cart = Cart.create
        session[:cart] = @current_cart.id
      end
    end
  end

  def json_request?
    request.format.json?
  end
end
