class Chalet < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_attachments :photos, maximum: 5
end
