class User < ApplicationRecord
  has_secure_password
  has_many :rocks, dependent: :destroy
  has_many :photos, through: :rocks , dependent: :destroy

  validates :full_name, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true

end
