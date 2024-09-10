class Photo < ApplicationRecord
  belongs_to :rock
  validates :rock_id, presence: true
  validates :url, presence: true
end
