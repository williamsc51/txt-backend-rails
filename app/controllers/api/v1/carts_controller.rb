class Api::V1::CartsController < ApplicationController
  def show
    @cart = current_cart
    render json: @cart, include: :books
  end
end
