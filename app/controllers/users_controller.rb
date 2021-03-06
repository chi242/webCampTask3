class UsersController < ApplicationController
  def index
      @users = User.all
      @user = current_user
  end

  def show
    @user = current_user
    @books = current_user.books
  end

  # def create
  # end

  def edit
    @user = current_user
  end


  def update
    @user = User.find(params[:id])
    @user.id = current_user.id
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :introduction)
    end
end
