class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :game
  # validates :game_id, :uniquness => {:scope => :user_id, :message => 'Already added sport'}

  validate :duplicate_entry, :on => :create

  def duplicate_entry
    interest_exist_check = Interest.where(game_id: self.game_id,user_id: self.user_id)
    self.errors.add(:base, "Already added") if interest_exist_check.present?
  end

end
