class GuessesController < ApplicationController
  def new
    @guess = Guess.new
  end

  def create
    @guess = Guess.new(guess_params)
    if params[:game_id]
      @game = Game.find(params[:game_id])
      @guess.word_1 = @game.current_player_guesses(current_player).last.answer
      @guess.word_2 = @game.other_player_guesses(current_player).last.answer
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
