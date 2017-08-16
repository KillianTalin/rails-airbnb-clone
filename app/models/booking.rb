class Booking < ApplicationRecord
  belongs_to :chalet
  belongs_to :user


  def during
    (self.end_date.to_time - self.start_date.to_time).to_i/ 86400
  end

  def before
    (self.start_date.to_time - Time.now).to_i / 86400
  end

  def finish
(self.end_date.to_time - Time.now).to_i / 86400

end
end
