class Comment < ApplicationRecord
  include PublicActivity::Common

  belongs_to :user
  belongs_to :pin
  validates :content, presence: true
end
