class Board < ApplicationRecord
  include PublicActivity::Common
  # tracked only: :create, owner: ->(controller, model) { controller && controller.current_user }

  belongs_to :user
  has_many :pin_boards
  has_many :pins, through: :pin_boards
  validates :name, presence: true

  has_many :pin_boards
  has_many :pins, through: :pin_boards

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize if name
  end

end
