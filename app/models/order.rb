class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :department
  has_many :details
  validates_associated :details
end
