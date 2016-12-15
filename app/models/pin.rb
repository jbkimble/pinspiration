class Pin < ApplicationRecord
  validates :name, presence: true
  validates :source, presence: true
  validates :image, presence: true

  has_many :boards
  has_many :comments
end
