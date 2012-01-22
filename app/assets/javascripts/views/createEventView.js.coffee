App or= {}
App.CreateEventView = Backbone.View.extend(
  el: "#edit_event"
  initialize: ->
    @form = $(this.el).find("form")
  events:
    "submit form" : "handleFormSubmission"
  handleFormSubmission: (e) ->
    e.stopPropagation()
    @createEvent()
    false
  createEvent: ()->
    evento = new App.Event(UTIL.parseFormAttributes(@form, "event").event)
    has_id = @form.attr("action").match(/\/events\/(\w*)/)
    if has_id
      evento.id = has_id[1]
      evento.save()
    else
      eventCollection.create(evento)
)
    
