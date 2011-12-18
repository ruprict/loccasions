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
    show:
        console.log("You're in event show")

UTIL =
  exec: ( controller, action )->
    ns =  App
    action or= "init"

    if ( controller != "" && ns[controller] && typeof ns[controller][action] == "function" )
      ns[controller][action]()

  init: ->
    body = document.body
    controller = body.getAttribute( "data-controller" )
    action = body.getAttribute( "data-action" )

    UTIL.exec( "common" )
    UTIL.exec( controller )
    UTIL.exec( controller, action )
  
$(UTIL.init)
    
