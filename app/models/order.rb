class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :department
  has_many :details, :dependent => :destroy
  validates_associated :details
end
