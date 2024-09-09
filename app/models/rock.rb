class Rock < ApplicationRecord
  has_many :photos, dependent: :destroy
end
