class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(list_params)
    respond_to do |format|
      if book.save
        format.html { redirect_to '/books', notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: book }
      else
        format.html { render :new }
        format.json { render json: book.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
  end

  def edit
  end

  def success
  end

  private
    def list_params
      params.require(:book).permit(:title, :body)
    end
end
