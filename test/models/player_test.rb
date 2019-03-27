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

  test 'invalid if name is too long' do
    player = Player.new(
      name: 'A very long name',
      strength_points: 3,
      intelligence_points: 6,
      magic_points: 5
    )
    refute player.valid?, 'player is valid with a long name'
    assert_not_nil @player.errors[:name], 'no validation error for name length'
  end

  test 'invalid if name is too short' do
    player = Player.new(
      name: 'Am',
      strength_points: 3,
      intelligence_points: 6,
      magic_points: 5
    )
    refute player.valid?, 'player is valid with a short name'
    assert_not_nil @player.errors[:name], 'no validation error for name length'
  end

  test 'invalid if sum of points is more than 15' do
    player = Player.new(
      name: 'Amo',
      strength_points: 5,
      intelligence_points: 6,
      magic_points: 5
    )
    refute player.valid?, 'player is valid a sum of points that is more than 15'
    assert_not_nil @player.errors[:strength_points], 'no error for max > 15'
  end
end
