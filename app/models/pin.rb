class Pin < ApplicationRecord
  validates :name, presence: true
  validates :source, presence: true
  validates :image, presence: true

  has_many :pin_boards
  has_many :boards, through: :pin_boards
  has_many :pin_comments
  has_many :comments, through: :pin_comments

  def self.order_pins
    order('updated_at DESC')
  end
end
