# frozen_string_literal: true

class AddScore1Score2ToBattles < ActiveRecord::Migration[5.2]
  def change
    add_column :battles, :score1, :float
    add_column :battles, :score2, :float
  end
end
