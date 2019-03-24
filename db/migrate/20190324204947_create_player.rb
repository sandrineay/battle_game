class CreatePlayer < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :life_points, null: false, default: 3
      t.integer :attack_points, null: false, default: 1
      t.integer :strength_points, null: false, default: 1
      t.integer :intelligence_points, null: false, default: 1
      t.integer :magic_points, null: false, default: 1

      t.timestamps
    end
  end
end
