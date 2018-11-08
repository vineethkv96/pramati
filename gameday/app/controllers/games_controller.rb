class GamesController < ApplicationController
  def index
    $games = Game.all
  end
  
  def create
    
  end
end
