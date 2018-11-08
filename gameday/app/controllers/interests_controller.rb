class InterestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index

  end

  def create
    game = Game.find_by name: params[:option]
    data = Interest.create(:game_id => game.id, :user_id => $current_user.id, :date_join =>Time.now.strftime("%m/%d/%Y"))
    if data
      redirect_to interest_path($current_user.id)
    else
      render 'new'
    end
  end

end
