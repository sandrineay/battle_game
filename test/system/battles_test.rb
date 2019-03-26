require "application_system_test_case"

class BattlesTest < ApplicationSystemTestCase
  test "visiting new_battle_path" do
    visit "battles/new"
    assert_selector ".player-item", count: Player.where('life_points > ?', 0.0).count
  end
end
