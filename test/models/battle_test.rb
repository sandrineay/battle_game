# frozen_string_literal: true

require 'test_helper'

class BattleTest < ActiveSupport::TestCase
  test 'invalid if player fights against himself' do
    battle = battles(:battle1)
    refute battle.valid?, 'battle is valid when player fights against himself'
  end
end
