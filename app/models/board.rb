class Board < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize if name
  end

end
