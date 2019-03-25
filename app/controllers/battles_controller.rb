class BattlesController < ApplicationController
  def new
    @players = Player.all
    @players_count = Player.count
  end

  def create
  end

  def show
  end
end
