class ChangePointsTypeForPlayers < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :life_points, :float, default: 3.0
    change_column :players, :attack_points, :float, default: 1.0
  end
end
