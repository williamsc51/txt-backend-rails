class Api::V1::BooksController < ApplicationController

  def index
    @books = BookFilters.apply(params)
    render json: @books
  end

  def show
    render json: book
  end

  private

  def book
    @book ||= Book.find(params[:id])
  end

  def book_params
    params.permit(:title, :author, :isbn, :price, :description, :condition, :image, :category)
  end
end
