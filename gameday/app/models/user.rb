class User < ApplicationRecord
  # has_and_belongs_to_many :games
  has_many :interests
  has_many :games, through: :interests

  validates :name, presence: true, length: {minimum:5, maximum:50 }
  validates :email, presence: true, length: {maximum:50}, uniqueness: true
  validates :address, presence: true
  validates :phone_number, presence: true, uniqueness: true, length: {minimum: 10,maximum:12}
  validates :password, presence: true
end