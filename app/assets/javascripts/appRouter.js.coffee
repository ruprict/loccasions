App or= {}
App.Router = Backbone.Router.extend
  initialize: ->
    @eventListView = new App.EventListView({collection: window.eventCollection})
    @eventListView.render()
    @eventEditView = new App.EventEditView()
    if $('#map').length > 0
      @mapView = new App.MapView(App.MapProviders.Leaflet)

