class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirm)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirm, :current_password) 
  end

  def after_sign_in_path_for(resource)
    store_user_info_path
  end

end