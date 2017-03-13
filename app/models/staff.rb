class Staff < ApplicationRecord
  belongs_to :department
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
