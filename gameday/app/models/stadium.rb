class Stadium < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  
  validates :name, presence: true, length: {minimum:5, maximum:50 }
  validates :address, presence: true
  validates :contact_number, presence: true, uniqueness: true, length: {minimum: 10,maximum:12}
  validates :game, presence: true
  validates :price_for_hour, presence: true
  validates :description, presence: true
end
