class window.AppView extends Backbone.View

  template: _.template '
  <div class="playerOne_container"></div>
  <div class="playerTwo_container"></div>
  '

  initialize: (params)->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    # @$el.html 'AppView'
    @$('.playerOne_container').html new HandView(collection: @model.get 'playerOne').el
    @$('.playerTwo_container').html new HandView(collection: @model.get 'playerTwo').el
