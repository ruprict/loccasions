App or= {}
App.MapView =  Backbone.View.extend
  el: "div#map",
  initialize: (mapProvider) -> 
    @mapFactory = mapProvider
    @render()
  addBaseLayer: ->
    @baseLayer = new @mapFactory.BaseMapLayer()
    @mapFactory.addLayerToMap(@map, @baseLayer)
  setInitialView: ->
    @mapFactory.setViewForMap(@map, @mapFactory.Point(51.505, 0.09), 13)
  render: ->
    @map = new @mapFactory.Map(@el.id)
    @addBaseLayer()
    @setInitialView()



