class BooksController < ApplicationController

  def top
  end

  def index
    @books = Book.all
    # @users =  Book.find(params[:id])
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @books = @user.name
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user
    if @book.save
      redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
      @books = Book.all
      render :index
    end
  end

  # def edit
  #   @book = Book.find(params[:id])
  # end

  # def update
  #   @book = Book.find(params[:id])
  #   if @book.update(book_params)
  #     redirect_to book_path(@book.id), notice: 'Book was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end
  # def destroy
  #   book = Book.find(params[:id])
  #   book.destroy
  #   redirect_to '/books', notice: 'Book was successfully destroy.'
  # end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
