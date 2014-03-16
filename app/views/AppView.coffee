class window.AppView extends Backbone.View

  template: _.template '
  <div class="board_container"></div>
  <div class="playerOne_container"></div>
  <div class="playerTwo_container"></div>
  '

  initialize: (params)->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    # @$el.html 'AppView'
    @$('.board_container').html new BoardView(collection: @model.get 'board').el
    @$('.playerOne_container').html new HandView(collection: @model.get 'playerOne').el
    @$('.playerTwo_container').html new HandView(collection: @model.get 'playerTwo').el
