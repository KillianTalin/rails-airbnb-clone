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
    observed_time_range = (Date.today - 30.days..Date.today)
    local_bookings = bookings.where(chalet: self)

    nb_beds_used_over_time = {}
    observed_time_range.each do |day|
      binding.pry
      local_bookings.each do |local_booking|
        booking_time_range = local_booking.start_date..local_booking.end_date
        if booking_time_range.cover? day

          if nb_beds_used_over_time.has_key?(day)
            nb_beds_used_over_time[day] += local_booking.guest_number
          else
            nb_beds_used_over_time[day] = local_booking.guest_number
          end

        end
      end
    end

  end

end
