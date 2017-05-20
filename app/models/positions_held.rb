class PositionsHeld < ApplicationRecord
  belongs_to :user
  belongs_to :position
  belongs_to :program
end
