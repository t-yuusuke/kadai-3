class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @usera = User.find(current_user[:id])
    @books = @user.books
  end

  def create
    @book = Book.new(book_params)
    @book = user.id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @user = User.find(current_user[:id])
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    @book = @user
    redirect_to user_path(current_user) unless @user ==current_user
  end

end
