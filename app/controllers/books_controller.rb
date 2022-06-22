class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(list_params)
    book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(book.id)
  end


  def show
    @data = Book.find(params[:id])
  end

  def edit
    @edit = Book.find(params[:id])
  end

  def success
  end

  def update
    book= Book.find(params[:id])
    book.update(list_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private
    def list_params
      params.require(:book).permit(:title, :body)
    end
end
