class Comment < ApplicationRecord
  include PublicActivity::Model
  tracked

  belongs_to :user
  belongs_to :pin
  validates :content, presence: true
end
