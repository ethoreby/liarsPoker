class window.HandView extends Backbone.View

  className: 'hand'

  template: _.template '
    <div></div>
  '

  initialize: (params)->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
