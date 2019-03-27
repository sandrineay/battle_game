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
      update_battle_scores(@battle)
      if @battle.score1 == @battle.score2
        @battle.draw = true
        @battle.save
      else
        update_battle_winner_loser(@battle)
        adjust_life_attack(@battle)
      end
      redirect_to battle_path(@battle)
    else
      render :new
    end
  end

  def show
    @winner = @battle.winner unless @battle.draw
    @loser = @battle.loser unless @battle.draw
    @winner_score = @battle.winner_score unless @battle.draw
    @loser_score = @battle.loser_score unless @battle.draw
  end

  private

  def update_battle_scores(battle)
    battle.score1 = battle.player_1.score
    battle.score2 = battle.player_2.score
    battle.save
  end

  def update_battle_winner_loser(battle)
    battle.winner = battle.battle_winner
    battle.loser = battle.battle_loser
    battle.winner_score = battle.battle_winner_score
    battle.loser_score = battle.battle_loser_score
    battle.save
  end

  def adjust_life_attack(battle)
    battle.winner.attack_points += 0.3
    battle.loser.life_points -= 1
    battle.winner.save
    battle.loser.save
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
