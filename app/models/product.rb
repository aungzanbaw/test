class Product < ApplicationRecord
  belongs_to :department
  # has_many :details
  # validates_associated :details
end
