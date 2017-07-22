App.game = App.cable.subscriptions.create("GameChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    let path_split = window.location.pathname.split('/')
    if (path_split[1] === 'games') {
      console.log('hello')
      id = parseInt(path_split[2])
      App.game.perform("start_listening", {game_id: 17});
    }
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data)
  }
});
