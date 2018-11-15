class ApplicationController < ActionController::Base
  include UserHelper
  include LoginHelper
  include GamesHelper
end
