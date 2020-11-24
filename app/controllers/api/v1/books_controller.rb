class Api::V1::BooksController < ApplicationController

  before_action :check_logged_in, only: [:create, :update]
  before_action :is_owner?, only: [:update]

  def index
    @books = BookFilters.apply(params)
    render json: @books
  end

  def create
    @book = Book.new(book_params.merge({user: current_user}))

    if @book.save
      render json: @book, status: :created
    else
      render json: {logged_in: false, message: "user needs to be authenticated", errors: @book.errors, status: :unprocessable_entity}
    end
  end

  def show
    @book = book
    render json: @book
  end

  def update
    @book = book

    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors
    end
  end

  private

  def book
    @book ||= Book.find(params[:id])
  end

  def is_owner?
    if current_user.id == book.user_id
      true
    else
      render json: { status: :unauthorized }
      false
    end
  end

  def book_params
    params.permit(:title, :author, :isbn, :price, :description, :condition, :image, :category)
  end
end
