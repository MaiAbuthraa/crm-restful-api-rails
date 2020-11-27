class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :customers,  foreign_key: :created_by_id
  has_many :contacts,  foreign_key: :created_by_id
  has_many :orders,  foreign_key: :created_by_id

  def admin?
    is_admin
  end
end
