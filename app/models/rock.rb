class Rock < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  # validates :rock_name, presence: true
  # validates :material, presence: true]
end
