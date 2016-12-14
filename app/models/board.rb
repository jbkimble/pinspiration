class Board < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  after_save :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end

end
