class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :phone, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_many :comments
  has_many :boards
end
