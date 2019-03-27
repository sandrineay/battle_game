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

  def create # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    @battle = Battle.new(battle_params)
    if @battle.save
      Battle.update_battle_scores(@battle)
      if @battle.score1 == @battle.score2
        @battle.draw = true
        @battle.save
      else
        Battle.update_battle_winner_loser(@battle)
        Player.adjust_life_attack(@battle)
      end
      redirect_to battle_path(@battle)
    else
      flash.now[:alert] = flash_alerts
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

  def flash_alerts
    errors = @battle.errors.full_messages
    'Please select two players :)' if errors.include? "Player 2 can't be blank"
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
