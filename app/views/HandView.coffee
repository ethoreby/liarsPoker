class window.HandView extends Backbone.View

  className: 'hand'

  template: _.template '
    <button class="endTurn-button">End Turn</button><div>Player:</div>
  '
  events:
    "click .endTurn-button": ->
      @collection.endTurn()

  initialize: (params)->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
