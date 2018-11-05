class UserController < ApplicationController
  def index
    @users = User.all;
  end

  def new
    @user = User.new;
  end

  def login
    @login = User.new(parameter)
    login = User.find_by_email(params[:user][:email])
    if @login && login.authenticate(params[:user][:password])
      redirect_to user_index_path
    else
      redirect_to '#'
    end

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

  private 
  def user_parameter
    params.require(:user).permit(:name, :email, :address, :phone_number, :password)
  end

  def parameter
    params.require(:login).permit(:email, :password)
  end

end
