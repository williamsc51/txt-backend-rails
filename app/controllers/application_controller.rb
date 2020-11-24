# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?
  include Authentication
  include ApiFilters

  before_action :current_cart

  def check_logged_in
    return if logged_in?

    render json: { status: :unauthorized, logged_in: "You are not logged in" }
    false
  end

  def current_cart
    if logged_in?
      @cart = @current_user.cart
    elsif session[:cart]
      @cart = Cart.find(session[:cart])
    else
      @cart = Cart.create
      session[:cart] = @cart.id
    end
  end

  protected

  def json_request?
    request.format.json?
  end
end
