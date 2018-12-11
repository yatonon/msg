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
    msg = event.target.value
    App.channel.speak msg if msg isnt ''
    event.target.value = ''
    event.preventDefault()

$(document).on 'click', '#post_image', (event) ->
  file = $('input#message_image').prop('files')[0]
  $('form#post_form').submit() if file isnt undefined
  event.preventDefault()

$(document).on 'click','#submit', (event) ->
  msg = $('#text').val()
  App.channel.speak msg if msg isnt '' 
  $('#text').val('')
 
