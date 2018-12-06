App.channel = App.cable.subscriptions.create "ChannelChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append data['message']

  speak: (message) ->
    send_user = $('#messages').data 'current-user'
    channel_id = $('#messages').data 'channel-id'
    @perform 'speak', message: message, send_user: send_user, channel_id: channel_id

$(document).on 'keypress', '[data-behavior~=channel_speaker]', (event) ->
  if event.keyCode is 13 # returnキーが押されたら
    App.channel.speak event.target.value
    event.target.value = ''
    event.preventDefault()

$(document).on 'click','#submit', (event) ->
  value = $('#text').val()
  App.channel.speak value  
  $('#text').val('')
 
