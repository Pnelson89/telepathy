class GameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def start_listening(game_data)
    stop_all_streams
    stream_for Game.find(game_data['game_id'])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
