# frozen_string_literal: true

class AddWinnerLoserAndScoresToBattles < ActiveRecord::Migration[5.2] #:nodoc:
  def change
    add_column :battles, :winner, :integer
    add_column :battles, :loser, :integer
    add_column :battles, :winner_score, :integer
    add_column :battles, :loser_score, :integer
  end
end