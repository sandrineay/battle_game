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
      if score(@battle.player_1) == score(@battle.player_2)
        @battle.draw = true
        @battle.save
      else
        battle_winner_loser(@battle)
        battle_scores(@battle)
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

  # def score(player)
  #   attack = player.attack_points
  #   # strength = player.strength_points
  #   # intelligence = player.intelligence_points
  #   # magic = player.magic_points
  #   # skills = [strength, intelligence, magic].shuffle!
  #   # attack + skills[0] * 0.8 + skills[1] * 0.7 + skills[2] * 0.9
  #   ret3.0
  # end

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
    score1 = score(battle.player_1)
    score2 = score(battle.player_2)
    battle.winner = winner_loser(score1, score2)[:winner].id
    battle.loser = winner_loser(score1, score2)[:loser].id
    battle.save
  end

  def battle_scores(battle)
    score1 = score(battle.player_1)
    score2 = score(battle.player_2)
    battle.winner_score = winner_loser_scores(score1, score2)[:winner_score]
    battle.loser_score = winner_loser_scores(score1, score2)[:loser_score]
    battle.save
  end

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def set_players
    @players = Player.where('life_points > ?', 0.0)
  end

  def battle_params
    params.require(:battle).permit(:player_1_id, :player_2_id)
  end
end
