# frozen_string_literal: true

class Battle < ApplicationRecord
  belongs_to :player_1, class_name: 'Player'
  belongs_to :player_2, class_name: 'Player'
  belongs_to :winner, class_name: 'Player', optional: true
  belongs_to :loser, class_name: 'Player', optional: true

  validates :player_1_id, presence: true
  validates :player_2_id, presence: true
end
