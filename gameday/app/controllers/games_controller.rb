class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    $games = Game.all
    $stadiums = Stadium.all
  end

  def show
  
  end
  
  def create

    if params[:date_data].empty?
      flash[:success] = "Select any date"
      # render 'new', :alert => 'Select date'
    else
      @user_data = []
      date = params[:date_data]
      game = Game.find_by name: params[:option]
      Interest.find_each do |interest|
        if interest.game_id == game.id && interest.date_join.strftime("%m/%d/%Y") == date
          @user_data.push(interest.user_id)
        end
        # binding.pry
      end
      # user_information @user_data
      if $current_user.nil?
        redirect_to game_path(0, userdata: @user_data, type: params[:option], date: date)
      else
        redirect_to game_path($current_user.id, userdata: @user_data, type: params[:option], date: date)
      end
      # binding.pry
    end
  end

end
