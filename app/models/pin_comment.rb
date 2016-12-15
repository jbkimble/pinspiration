class PinComment < ApplicationRecord
  belongs_to :comment
  belongs_to :pin
end
