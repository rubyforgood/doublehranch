class Position < ApplicationRecord
  has_many :positions_held
  has_many :users, through: :positions_held
end
