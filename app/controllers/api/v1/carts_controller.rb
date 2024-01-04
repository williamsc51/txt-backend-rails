class Api::V1::CartsController < ApplicationController

  def show
    render json: @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    
    render json: { message: "cart deleted" }, status: 200
  end
end
