class StadiumsController < ApplicationController
  def index
    
  end

  def new
    @stadium = Stadium.new;
  end

  def show
    @stadium = Stadium.all
  end

  def create
    @stadium = Stadium.new(parameter)
    # binding.pry
    if(@stadium.save)
      redirect_to stadiums_path
    else
      render 'new'
    end
  end

  private def parameter
    params.require(:stadium).permit(:name, :address, :contact_number, :game, :price_for_hour, :description)
  end

end
