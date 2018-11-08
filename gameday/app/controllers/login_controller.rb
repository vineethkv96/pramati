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
        redirect_to login_path(login), :notice => "Login successfully"
      end
    else
      if @login.valid?
      end
      #flash.now.alert = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path, :notice => "Log out successfully"
  end

  private def login_parameter
    params.require(:login).permit(:email, :password)
  end

end
