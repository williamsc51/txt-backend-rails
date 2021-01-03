# frozen_string_literal: true

class Api::V1::BooksCartsController < ApplicationController
  def index
    cart = current_cart
    @books = BooksCart.where("cart_id = #{cart.id}")
    render json: @books
  end

  def create
    @cart_item = BooksCart.new(books_carts_params)

    if @cart_item.save
      # TODO: consider just returning message (item added to cart)
      render json: @cart_item
    else
      render json: { errors: @cart_item.errors }
    end
  end

  def destroy
    @cart_item = BooksCart.find(params[:id])
    @cart_item.destroy
  end

  private

  def books_carts_params
    params.permit(:cart_id, :book_id)
  end
end
