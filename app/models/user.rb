class User < ApplicationRecord
  has_secure_password
  has_many :rocks, dependent: :destroy
  has_many :photos, through: :rocks , dependent: :destroy

  validates :full_name, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  validates :password, presence: true, confirmation: true, on: :create

  validate :password_validation_on_update, if: :password

  private

  def password_validation_on_update
    if password.present? && password_confirmation.blank?
      errors.add(:password_confirmation, "can't be blank")
    end
  end
end
