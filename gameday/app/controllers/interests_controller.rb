class InterestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index

  end

  def create
    game = Game.find_by name: params[:option]
    data = Interest.create(:game_id => game.id, :user_id => $current_user.id, :date_join =>Date.today)
    if data.id != nil
      redirect_to interest_path($current_user.id)
    else
      redirect_to login_path($current_user.id)
    end
  end

end
