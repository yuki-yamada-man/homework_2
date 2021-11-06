class UsersController < ApplicationController

  def index
    @book_new = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.book
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.path)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
end
