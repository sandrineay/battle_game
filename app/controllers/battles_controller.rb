class BattlesController < ApplicationController
  def new
    @players = Player.all
    @players_count = Player.count
    @battle = Battle.new
  end

  def create
  end

  def show
  end
end
