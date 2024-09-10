class Rock < ApplicationRecord
  has_many :photos, dependent: :destroy
  # validates :rock_name, presence: true
  # validates :material, presence: true
end