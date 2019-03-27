# frozen_string_literal: true

class AddPictureToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :picture, :string
  end
end
