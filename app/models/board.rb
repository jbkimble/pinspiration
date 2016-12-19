class Board < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  has_many :pin_boards
  has_many :pins, through: :pin_boards

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize if name
  end

end
