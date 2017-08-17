class Booking < ApplicationRecord
  belongs_to :chalet
  belongs_to :user
  validates :start_date, :end_date, :presence => true
  validates :user_id, :presence => true
  validates :chalet_id, :presence => true
  validates :statut, inclusion: {in: [ "Pending", "Validé", "Annulé"]}
  before_save :cant_reserve_own_chalet?
  # before_save :cant_book_before_today?


  def cant_reserve_own_chalet?
    if self.user == self.chalet.user
        raise "error"
    end
  end

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

  # def cant_book_before_today?
  #   if passed
  #     raise "error"
  #   end
  # end

  def futur
    before > 0
  end

  def now
    (finish > 0) && (before < 0)
  end
end
