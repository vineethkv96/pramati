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
    # binding.pry
    if(@user.save)
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    # @user = User.find(params[:id])
    # respond_to do |format|
    #   binding.pry
    #   if @user.update(user_parameter)
    #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
    update_account
    flash[:notice] = 'User was successfully updated..'
    redirect_to root_path
  end

  def destroy
    delete_account
    redirect_to root_path, :notice => "Account deleted successfully"
  end

  private def user_parameter
    params.require(:user).permit(:name, :email, :address, :phone_number, :password)
  end

end