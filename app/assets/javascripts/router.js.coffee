App or= {}
App.Router = Backbone.Router.extend
  routes:
    ""      : "index"
  index: ->
    @eventListView = new App.EventListView({collection: window.eventCollection or= new App.EventsCollection()})
    @eventListView.render()
    @eventEditView = new App.EventEditView()
    if $('#map').length > 0
      @mapView = new App.MapView(App.MapProviders.Leaflet)
      @mapView.render()

