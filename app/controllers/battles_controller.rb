class BattlesController < ApplicationController
  before_action :set_battle, only: :show

  def new
    @players = Player.all
    @players_count = Player.count
    @battle = Battle.new
  end

  def create
    @battle = Battle.new(battle_params)
    if @battle.save
      redirect_to battle_path(@battle)
    else
      render :new
    end
  end

  def show
  end

  private

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def battle_params
    params.require(:battle).permit(:player_1_id, :player_2_id)
  end
end
