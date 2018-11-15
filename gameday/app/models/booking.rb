class Booking < ApplicationRecord
  belongs_to :stadium
  belongs_to :user
end
