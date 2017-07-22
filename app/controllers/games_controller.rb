class GamesController < ApplicationController
  def create
    @game = Game.new()
    @game.save
    render :show
  end

  def new
    redirect_to new_guess_path
  end

  def show
    @game = Game.find(params[:id])
    @guess = Guess.new()
    @pone_guesses = @game.guesses.select { |guess| guess.player == current_player }
    @ptwo_guesses = @game.guesses.reject { |guess| guess.player == current_player }
    @show_button = true if @pone_guesses.length <= @ptwo_guesses.length

  end

  def find_or_create_game
    open_games = Game.all.select do |game|
      game.players.length == 1
    end

    if open_games.length > 0
      return open_games.first
    else
      new_game = Game.create
      return new_game
    end
  end
end
