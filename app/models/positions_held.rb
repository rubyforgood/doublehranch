class PositionsHeld < ApplicationRecord
  belongs_to :user
  belongs_to :position, optional: true
  belongs_to :program, optional: true
end
