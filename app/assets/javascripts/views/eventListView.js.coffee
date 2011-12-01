App or= {}
App.EventListView = Backbone.View.extend
  el: "#eventsList"
  initialize: () ->
    _(@).bindAll('eventAdded')
    @collection.bind("add", @eventAdded, @)
    @collection.bind("all", @render, @)
  eventAdded: (ev) ->
    @addEvent(ev)
  render: ->
    @clearList()
    @collection.each(@addEvent, @)
  clearList: ->
    $(@el).empty()
  addEvent: (ev) ->
      view = new App.EventView({model: ev})
      $(@el ).append(view.render().el)


