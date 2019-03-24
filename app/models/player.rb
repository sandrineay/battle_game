class Player < ApplicationRecord
  validates :name, uniqueness: true
end
