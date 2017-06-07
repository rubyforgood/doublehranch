class PositionsHeld < ApplicationRecord
  belongs_to :user
  belongs_to :position, optional: true
  belongs_to :program, optional: true

  def name
    "#{position&.name} (#{program&.name})"
  end
end
