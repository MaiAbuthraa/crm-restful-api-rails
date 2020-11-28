class Contact < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  belongs_to :customer

  validates :name, presence: true
  validates :email, presence: true
end
