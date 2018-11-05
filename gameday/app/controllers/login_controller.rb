class LoginController < ApplicationController

  def index
  end

  def new
    @login = User.new
  end

  def show
    @login = User.find(params[:id])
  end

  def create
    login = User.find_by_email(login_parameter[:email])
    if login
      if login.password === login_parameter[:password]
        redirect_to login_path(login)
      end
    else
      flash[:danger]="Invalid Email/Password Combination"
      redirect_to new_login_path
    end
  end

  private 
  def login_parameter
    params.require(:login).permit(:email, :password)
  end

end
