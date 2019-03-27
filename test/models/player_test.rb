# frozen_string_literal: true

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test 'score returns the right potential value' do
    player = Player.new(
      name: 'gimli',
      attack_points: 1.0,
      life_points: 3.0,
      intelligence_points: 3,
      magic_points: 1,
      strength_points: 6
    )
    assert(player.score.between?(5, 9))
  end
end
