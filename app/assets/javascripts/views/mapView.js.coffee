App or= {}
App.MapView =  Backbone.View.extend
  el: "div#map"
  events:
    "map:occasionAdded" : "handleSubmit"
  initialize: (mapProvider) ->
    @mapFactory = mapProvider
    @collection = window.occasionCollection 
    @collection.bind("add", @addOccasion, this)
    @collection.bind("all", @drawOccasions, this)
  addBaseLayer: ->
    @baseLayer = new @mapFactory.BaseMapLayer()
    @mapFactory.addLayerToMap(@map, @baseLayer)
  setInitialView: ->
    @mapFactory.setViewForMap(@map, @mapFactory.Point(51.505, 0.09), 13)
  render: ->
    @map = new @mapFactory.Map(@el.id)
    @mapFactory.addClickHandler(@map,@newOccasion.bind(@))
    @addBaseLayer()
    @setInitialView()
    @drawOccasions()
  drawOccasions: () ->
    self = this
    @mapFactory.removeAllMarkers(@map)
    window.occasionCollection.each((occ)->
      self.mapFactory.addOccasion(self.map,occ)
    )
  newOccasion: (e) ->
    view = new App.CreateOccasionView()
    view.render()
    @mapFactory.addNewOccasionMarker(@map, e,view.el )
  addOccasion: (occ) ->
    @mapFactory.addOccasion(@map, occ)
  handleSubmit: ->
    @mapFactory.hidePopup(@map)
     



