class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(list_params)
    respond_to do |format|
      if book.save
        format.html { redirect_to book, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: book }
      else
        format.html { render :index }
        format.json { render json: book.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    @data = Book.find(params[:id])
  end

  def edit
    @edit = Book.find(params[:id])
  end

  def success
  end

  private
    def list_params
      params.require(:book).permit(:title, :body)
    end
end
