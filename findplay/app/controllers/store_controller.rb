class StoreController < ApplicationController
  def index
    # redirect_to(http://localhost:3000/store/user_info);
  end
  def users_info
  end

  def after_sign_in_path_for(resource)
    store_user_info_path
  end

end
