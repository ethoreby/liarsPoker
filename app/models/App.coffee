class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'board', board = new Board()
    @set 'playerOne', deck.newPlayer()
    @set 'playerTwo', deck.newPlayer()
    @set 'round', 0

    @get 'playerOne'
      .on 'endTurn', =>
        @nextCard()

  nextCard: ->    #add a card, or 3 cards in first round

    for num in [0..3]
      round = @get('round')
      if round <= 2
        n = if round is 0 then 3 else 1
        board = @get('board')
        board.add(@get('deck')
          .pop()) for num in [0...n]

        @set 'round', round + 1
      else
        @endGame()

  endGame: ->
    console.log 'game over'
    @evalHand(@get 'playerOne')

  evalHand:(player) ->

    #array hierarchy of poker hands, card numbers multiply
    handTypes = [0...9]
    board = @get 'board'
    c1 = player.at(0)
    c2 = player.at(1)

    #check high card
    handTypes[0] = c1.attributes.value
    handTypes[0] = c2.attributes.value if c2.attributes.value > handTypes[0]

    console.log c1.attributes, c2.attributes

    #check pairs
    handTypes[1] = 0
    if c1.attributes.value is c2.attributes.value
      handTypes[1] = c1.attributes.value
    for i in [0...5]
      if c1.attributes.value is board.at(i).attributes.value
        handTypes[1] = c1.attributes.value
      if c2.attributes.value is board.at(i).attributes.value and c2.attributes.value > handTypes[1]
        handTypes[1] = c2.attributes.value

    console.log handTypes











