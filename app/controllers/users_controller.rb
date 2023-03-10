class UsersController < ApplicationController

  def show
    @users = User.all
    @user = User.find(params[:id])
    @newbook = Book.new
    @books = @user.books
  end

  def index
    @user = current_user
    @users = User.all
    @newbook = Book.new
    @books = Book.all
  end


  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Update successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to user_path(current_user.id)
    end
  end
end
