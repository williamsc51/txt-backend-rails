# frozen_string_literal: true

class Api::V1::BooksCartsController < ApplicationController
  def create
    book = Book.find_by(id: params[:book_id])
    current_cart = @current_cart

    if current_cart.books.include?(book)
      @cart_item = current_cart.books_carts.find_by(book_id: book.id)
      @cart_item.quantity += 1
    else
      @cart_item = BooksCart.new
      @cart_item.cart = current_cart
      @cart_item.book = book
    end

    if @cart_item.save
      render json: { message: "Item added to cart" }, status: :created
    else
      render json: { errors: @cart_item.errors }
    end
  end

  def destroy
    @cart_item = BooksCart.find(params[:id])
    @cart_item.destroy

    render json: { message: "Item removed from cart" }
  end

  def add_quantity
    @cart_item = BooksCart.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save
    
    render json: { message: "Quantity added to cart" }
  end
  
  def reduce_quantity
    @cart_item = BooksCart.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
    end
    @cart_item.save
    
    render json: { message: "Quantity reduced in cart" }
  end

  private

  def books_carts_params
    params.permit(:cart_id, :book_id)
  end
end
