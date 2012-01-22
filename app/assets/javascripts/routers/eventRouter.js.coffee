App or= {}
App.EventRouter = Backbone.Router.extend
  routes:
    ""      : "index"
  index: ->
    @occasionListView = new App.OccasionListView
      collection: window.occasionCollection or= new App.OccasionsCollection() 
    @occasionListView.render()
    @createOccasionView = new App.CreateOccasionView()
    if $('#map').length > 0
      @mapView = new App.MapView(App.MapProviders.Leaflet)
      @mapView.render()


