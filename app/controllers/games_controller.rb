class GamesController < ApplicationController
  def new
    @game = Game.new()
    @game.save
    render :show
  end

  def show
  end
end
