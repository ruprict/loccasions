App or= {}
App.EventView = Backbone.View.extend
  model: App.Event
  events: 
    "submit form" : "deleteEvent"
  tagName: "li"
  render: ->
    template = App.TemplateProvider.applyTemplate("events","line_item", @model)
    $(this.el).html(template)
    @
  deleteEvent: (e)->
    e.stopPropagation()
    id = $(e.currentTarget).attr("action").match(/\/events\/(\w*)/)[1]
    deadEvent = eventCollection.get(id);
    deadEvent.destroy()
    false
