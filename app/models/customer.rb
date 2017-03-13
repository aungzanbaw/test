class Customer < ApplicationRecord
  has_many :orders
  validates :phone, presence: true, uniqueness: true
  validates :password, presence: true
  validates_associated :orders

  # For API authentication
  has_secure_token :auth_token #rails 5
  before_create :set_auth_token

  private
    def set_auth_token
      return if auth_token.present?
      self.auth_token = SecureRandom.uuid.gsub(/\-/,'')
    end
end
