App.room = App.cable.subscriptions.create  "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # alertを表示させる処理
    # alert data['message']
    $('#messages_index').append data['message']

  speak: (message) ->
    @perform 'speak', message: message

  $(document).on 'keypress', '[data-behavior~=room_speak]', (event) ->
  if event.keyCode is 13
    #コンソールで接続確認を使ったコード
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
