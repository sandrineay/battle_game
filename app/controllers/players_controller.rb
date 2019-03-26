# frozen_string_literal: true

class PlayersController < ApplicationController #:nodoc:
  before_action :set_player, only: %i[edit update destroy]

  def index
    @players = Player.all
    @players_count = Player.count
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to new_battle_path
    else
      render :new
    end
  end

  def edit
    # edit method
  end

  def update
    if @player.update(player_params)
      redirect_to players_path
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(
      :name,
      :picture,
      :strength_points,
      :intelligence_points,
      :magic_points
    )
  end
end
