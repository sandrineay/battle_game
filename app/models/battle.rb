# frozen_string_literal: true

class Battle < ApplicationRecord
  belongs_to :player_1, class_name: 'Player'
  belongs_to :player_2, class_name: 'Player'
  belongs_to :winner, class_name: 'Player', optional: true
  belongs_to :loser, class_name: 'Player', optional: true

  validates :player_1_id, presence: true
  validates :player_2_id, presence: true

  def winner_loser(score1, score2)
    {
      winner: score1 > score2 ? player_1 : player_2,
      loser: score1 > score2 ? player_2 : player_1,
      winner_score: score1 > score2 ? score1 : score2,
      loser_score: score1 > score2 ? score2 : score1
    }
  end

  def battle_winner
    winner_loser(score1, score2)[:winner]
  end

  def battle_loser
    winner_loser(score1, score2)[:loser]
  end

  def battle_winner_score
    winner_loser(score1, score2)[:winner_score]
  end

  def battle_loser_score
    winner_loser(score1, score2)[:loser_score]
  end
end
