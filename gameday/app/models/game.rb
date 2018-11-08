class Game < ApplicationRecord
  # has_and_belongs_to_many :users
  has_many :interests
  has_many :users, through: :interests
end
