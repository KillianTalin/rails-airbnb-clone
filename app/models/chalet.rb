class Chalet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :user_id, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
  validates :photos, presence: true

  has_attachments :photos, maximum: 5
  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  def occupation_rate
    local_capacity = 30 * capacity
    local_bookings = bookings.where()
  end

end
