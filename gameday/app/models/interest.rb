class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :game
  # validates :game_id, :uniquness => {:scope => :user_id, :message => 'Already added sport'}
end
