# frozen_string_literal: true

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  def setup
    @player = Player.new(
      name: 'Player Name',
      strength_points: 5,
      intelligence_points: 4,
      magic_points: 6
    )
  end

  test 'valid player' do
    assert @player.valid?
  end

  test 'invalid without name' do
    @player.name = nil
    refute @player.valid?, 'player is valid without a name'
    assert_not_nil @player.errors[:name], 'no validation error for name present'
  end

  test 'invalid if name is not unique' do
    Player.create(
      name: 'Player Name',
      strength_points: 3,
      intelligence_points: 6,
      magic_points: 5
    )
    refute @player.valid?, 'player is valid without a unique name'
    assert_not_nil @player.errors[:name], 'no validation error for name unique'
  end
end
