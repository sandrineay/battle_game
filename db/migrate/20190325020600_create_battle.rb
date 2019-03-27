# frozen_string_literal: true

class CreateBattle < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.integer :player_1_id
      t.integer :player_2_id
      t.timestamps
    end
  end
end
