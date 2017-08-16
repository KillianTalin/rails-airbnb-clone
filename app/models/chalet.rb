class Chalet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachments :photos, maximum: 5
  geocoded_by :city
  after_validation :geocode, if: :city_changed?

end
