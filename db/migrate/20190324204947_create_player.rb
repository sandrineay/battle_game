# frozen_string_literal: true

class CreatePlayer < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :life_points, null: false, default: 5
      t.float :attack_points, null: false, default: 1.0
      t.integer :strength_points, null: false, default: 6
      t.integer :intelligence_points, null: false, default: 4
      t.integer :magic_points, null: false, default: 5

      t.timestamps
    end
  end
end
