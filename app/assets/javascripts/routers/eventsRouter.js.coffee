App or= {}
App.EventsRouter = Backbone.Router.extend
  routes:
    ""      : "index"
  index: ->
    @eventListView = new App.EventListView({collection: window.eventCollection or= new App.EventsCollection()})
    @eventListView.render()
    @createEventView = new App.CreateEventView()
    if $('#map').length > 0
      @mapView = new App.MapView(App.MapProviders.Leaflet)
      @mapView.render()

