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

  def create
    @battle = Battle.new(battle_params)
    if @battle.save
      # score1 = score(@battle.player_1)
      # score2 = score(@battle.player_2)
      # @battle.winner = winner_loser(score1, score2)[:winner].id
      # @battle.loser = winner_loser(score1, score2)[:loser].id
      # redirect_to battle_path(@battle)
    else
      render :new
    end
  end

  def show
    # show method
  end

  private

  def score(player)
    attack = player.attack_points
    strength = player.strength_points
    intelligence = player.intelligence_points
    magic = player.magic_points
    attack + strength * 0.8 + intelligence * 0.7 + magic * 0.9
  end

  def winner_loser(score1, score2)
    if score1 > score2
      { winner: @battle.player_1, loser: @battle.player_2 }
    else
      { winner: @battle.player_2, loser: @battle.player_1 }
    end
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
