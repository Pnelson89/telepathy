class Guess < ApplicationRecord
  validates :answer, :game_id, :player_id, presence: true

  belongs_to :player
  belongs_to :game
end
