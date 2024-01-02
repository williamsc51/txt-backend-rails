# frozen_string_literal: true

class BooksController <  BaseController
  
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = 5
    if @book.save
      redirect_to(books_path)
    else
      render('new')
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to(book_path(@book))
    else
      render('edit')
    end

  end

  def delete
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :price, :description, :condition, :image, :category)
  end

end
