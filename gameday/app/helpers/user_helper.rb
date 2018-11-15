module UserHelper

  def delete_account
    # binding.pry
    session.delete(:user_id)
    User.destroy($current_user.id)
    $current_user = nil
  end
end
