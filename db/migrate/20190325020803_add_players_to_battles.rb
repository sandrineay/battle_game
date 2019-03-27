# frozen_string_literal: true

class AddPlayersToBattles < ActiveRecord::Migration[5.2]
  def change
    add_column :battles, :player_1_id, :integer
    add_column :battles, :player_2_id, :integer
  end
end
