class Department < ApplicationRecord
  has_many :staffs
  has_many :products
  has_many :orders # each order has specific department & manage by that department staff
  validates :name, presence: true
  validates_associated :staffs
  validates_associated :products
end
