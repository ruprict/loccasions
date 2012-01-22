App or= {}
App.OccasionListView = Backbone.View.extend
  el: "#occasionsList"
  initialize: () ->
    _(@).bindAll('occasionAdded')
    @collection.bind("add", @occasionAdded, @)
    @collection.bind("all", @render, @)
  occasionAdded: (ev) ->
    @addOccasion(ev)
  render: ->
    @clearList()
    @collection.each(@addOccasion, @)
  clearList: ->
    $(@el).empty()
  addOccasion: (ev) ->
      view = new App.OccasionView({model: ev})
      $(@el ).append(view.render().el)


