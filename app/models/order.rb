class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :created_by, class_name: 'User'

  enum status: [ :pending, :on_way, :on_door, :done]

  validates :status, presence: true
  validates :description, presence: true
end
