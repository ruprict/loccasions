window.App =
  start: ->
    window.eventCollection = new App.EventsCollection(bootstrapEvents)
    new App.Router()

    
