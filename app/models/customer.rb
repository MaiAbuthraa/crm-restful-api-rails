class Customer < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_many :orders
end
