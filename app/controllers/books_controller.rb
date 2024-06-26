class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    # book = Book.new(book_params)
    # book.save
    # redirect_to book_path(book.id)

    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end

  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    # book = Book.find(params[:id])
    # book.update(book_params)
    # redirect_to book_path(book.id)
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      @errors = @book.errors.full_messages
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    # byebug
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
    # if @book.destroy
    #   flash[:notice] = "Book was successfully destroyed."
    #   redirect_to books_path
    # else
    #   @books = Book.all
    #   render :index
    # end
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end
