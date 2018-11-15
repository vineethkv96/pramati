class BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    if params[:payment_option]=="Cash"
      booking = Booking.new(user_id: $current_user.id, stadium_id: $selected_stadium.id, game_id: $selected_stadium.game, booking_date: Date.today.strftime("%m/%d/%Y"), time_slot: params[:time_option], is_paid: "no")
      if booking.valid? 
        booking.save 
      end
    else
      render 'new'
    end
  end

end
end