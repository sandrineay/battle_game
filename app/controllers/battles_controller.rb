# frozen_string_literal: true

class BattlesController < ApplicationController #:nodoc:
  before_action :set_battle, only: :show
  before_action :set_players, only: %i[new create]

  def index
    @battles = Battle.all
  end

  def new
    @players_count = Player.count
    @battle = Battle.new
  end

  def create # rubocop:disable Metrics/MethodLength
    @battle = Battle.new(battle_params)
    if @battle.save
      battle_scores(@battle)
      if @battle.winner_score == @battle.loser_score
        @battle.draw = true
        @battle.save
      else
        battle_winner_loser(@battle)
        adjust_life_attack(@battle)
      end
      redirect_to battle_path(@battle)
    else
      render :new
    end
  end

  def show
    @winner = Player.find(@battle.winner) unless @battle.draw
    @loser = Player.find(@battle.loser) unless @battle.draw
    @winner_score = @battle.winner_score unless @battle.draw
    @loser_score = @battle.loser_score unless @battle.draw
  end

  private

  def winner_loser_scores(score1, score2)
    if score1 > score2
      { winner_score: score1, loser_score: score2 }
    else
      { winner_score: score2, loser_score: score1 }
    end
  end

  def winner_loser(score1, score2)
    if score1 > score2
      { winner: @battle.player_1, loser: @battle.player_2 }
    else
      { winner: @battle.player_2, loser: @battle.player_1 }
    end
  end

  def battle_winner_loser(battle)
    score1 = battle.player_1.score
    score2 = battle.player_2.score
    battle.winner_id = winner_loser(score1, score2)[:winner].id
    battle.loser_id = winner_loser(score1, score2)[:loser].id
    battle.save
  end

  def battle_scores(battle)
    score1 = battle.player_1.score
    score2 = battle.player_2.score
    battle.winner_score = winner_loser_scores(score1, score2)[:winner_score]
    battle.loser_score = winner_loser_scores(score1, score2)[:loser_score]
    battle.save
  end

  def adjust_life_attack(battle)
    winner = Player.find(battle.winner)
    loser = Player.find(battle.loser)
    winner.life_points += 1
    winner.attack_points += 0.3
    loser.life_points -= 1
    winner.save
    loser.save
  end

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def set_players
    @players = Player.where('life_points > ?', 0.0).order(life_points: :desc)
  end

  def battle_params
    params.require(:battle).permit(:player_1_id, :player_2_id)
  end
end
