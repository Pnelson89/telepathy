class Game < ApplicationRecord
  has_many :guesses
  has_many :players, through: :guesses

  def self.find_or_create_game
    open_games = self.all.select do |game|
      game.players.uniq.length == 1
    end
    if open_games.length > 0
      return open_games.first
    else
      new_game = self.create
      return new_game
    end
  end

  def current_player_guesses(current_player)
    self.guesses.select { |guess| guess.player == current_player }
  end

  def other_player_guesses(current_player)
    self.guesses.reject { |guess| guess.player == current_player }
  end

end
