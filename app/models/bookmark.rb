class Bookmark < ApplicationRecord
  belongs_to :chalet
  belongs_to :user

  validates :start_end :end_date :guest_number :user :chalet :checkout, presence: true
end
