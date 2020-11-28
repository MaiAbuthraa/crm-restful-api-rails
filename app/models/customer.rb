class Customer < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_many :orders
  has_many :contacts

  validates :name, presence: true
  validates :company_name, presence: true
  validates :category, presence: true
end
