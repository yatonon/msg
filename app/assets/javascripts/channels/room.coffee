App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append data['message']

  speak: (message) ->
    send_user = $('#messages').data 'current-user'
    room_id = $('#messages').data 'room-id'
    @perform 'speak', message: message, send_user: send_user, room_id

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # returnキーが押されたら
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()