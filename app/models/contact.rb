class Contact < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  belongs_to :customer

  validates :name, presence: true
  validates :email, presence: true
  validates :created_by_id, presence: true
end
