# frozen_string_literal: true

class AddDrawToBattles < ActiveRecord::Migration[5.2]
  def change
    add_column :battles, :draw, :boolean, default: false
  end
end
