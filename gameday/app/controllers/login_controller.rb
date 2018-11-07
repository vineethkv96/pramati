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
    @login = User.new
    login = User.find_by_email(login_parameter[:email])
    if login
      if login.password === login_parameter[:password]
        log_in login
        redirect_to login_path(login)
      end
    else
      if @login.valid?
      end
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private def login_parameter
    params.require(:login).permit(:email, :password)
  end

end
