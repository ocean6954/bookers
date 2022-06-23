class BooksController < ApplicationController

  def create
    @book = Book.new(list_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @data = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id]) #データベースから一つだけ取得
  end

  def update
    @book = Book.new(list_params)
    # book = Book.find(params[:id])
    if @book.save
      @book.update(list_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book.id)
    else
      @books = Book.all
      render :edit
      # redirect_to "https://www.google.com/"
    end
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