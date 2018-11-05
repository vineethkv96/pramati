class UserController < ApplicationController
  def index
    @users = User.all;
  end

  def new
    @user = User.new;
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_parameter)
    if(@user.save)
      redirect_to @user
    else
      render 'new'
    end
  end

  private def user_parameter
    params.require(:user).permit(:name, :email, :address, :phone_number, :password)
  end
end