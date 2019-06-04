#Add mentioned code
App.order = App.cable.subscriptions.create "InvoiceChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if document.getElementById("invoices_table") != null
      goToHome();
