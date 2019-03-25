class BattlesController < ApplicationController
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

  def battle_params
    params.require(:battle).permit(:player_1_id, :player_2_id)
  end
end
