class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerOne', deck.newPlayer()
    @set 'playerTwo', deck.newPlayer()
