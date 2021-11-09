class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book_new = Book.new(book.params)
    @book_new.user_id = current_user.id
    if @book_new.save
      redirect_to book_path(@book_new.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @book_new = Book.all
    @user = current_user
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
