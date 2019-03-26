class PlayersController < ApplicationController
  before_action :set_players, only: [:index, :create]

  def index
    @players_count = Player.count
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_players
    @players = Player.all
  end

  def player_params
    params.require(:player).permit(:name, :picture, :strength_points, :intelligence_points, :magic_points)
  end
end
