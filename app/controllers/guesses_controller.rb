class GuessesController < ApplicationController
  def new
    @guess = Guess.new
  end

  def create
    @guess = Guess.new(guess_params)
    @game = Game.find(params[:game_id])
    if @game
      @guess.word_1 = @game.current_player_guesses(current_player).last
      @guess.word_2 = @game.other_player_guesses(current_player).last
    else
      @game = Game.find_or_create_game()
    end

    @guess.game = @game
    @guess.player = current_player
    @guess.save
    redirect_to game_path(@guess.game)
  end

  private
  def guess_params
    params.require(:guess).permit(:answer)
  end
end
