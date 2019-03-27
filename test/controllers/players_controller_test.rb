# frozen_string_literal: true

require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:legolas)
  end

  test 'updating a player' do
    patch player_url(@player), params: { player: { name: 'updated' } }

    assert_redirected_to new_battle_path

    @player.reload
    assert_equal 'updated', @player.name
  end

  test 'should destroy player' do
    assert_difference('Player.count', -1) do
      delete player_url(@player), xhr: true
    end
  end
end
