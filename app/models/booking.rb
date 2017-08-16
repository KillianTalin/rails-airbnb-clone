class Booking < ApplicationRecord
  belongs_to :chalet
  belongs_to :user
  validates :chalet_id, presence: true
  validates :user_id, presence: true

  def during
    (self.end_date.to_time - self.start_date.to_time).to_i/ 86400
  end

  def price
  self.checkout = (during * self.chalet.price).to_f
  self.save
  end

  def before
    (self.start_date.to_time - Time.now).to_i / 86400
  end

  def finished_ago
    (Time.now - self.start_date.to_time).to_i / 86400
  end

  def finish
    (self.end_date.to_time - Time.now).to_i / 86400
  end

  def passed
    (finish < 0) && (before < 0)
  end

  def futur
    before > 0
  end

  def now
    (finish > 0) && (before < 0)
  end
end
