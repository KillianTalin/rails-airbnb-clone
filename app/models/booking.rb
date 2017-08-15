class Booking < ApplicationRecord
  belongs_to :chalet
  belongs_to :user
end
