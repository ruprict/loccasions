window.App =
  common:
    init: ->
  events:
    init: ->
    index: ->
      window.eventCollection = new App.EventsCollection(bootstrapEvents)
      new App.EventsRouter()
      Backbone.history.start
        root: "/events"
    show: ->
      window.App.event_id =  location.href.match(/\/events\/(.*)/)[1]
      window.occasionCollection = new App.OccasionsCollection(bootstrapOccasions)
      new App.EventRouter()
      Backbone.history.start
        root: "/events/"+window.App.event_id

    
