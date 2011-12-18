window.App =
  start: ->
    window.eventCollection = new App.EventsCollection(bootstrapEvents)
    new App.Router()
    Backbone.history.start
      root: "/events"

    
