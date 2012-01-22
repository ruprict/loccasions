App or= {}
App.OccasionView = Backbone.View.extend
  model: App.Occasion
  events: 
    "submit form" : "deleteOccasion"
  tagName: "li"
  render: ->
    template = App.TemplateProvider.applyTemplate("occasions","line_item", @model)
    $(this.el).html(template)
    @
  deleteOccasion: (e)->
    e.stopPropagation()
    id = $(e.currentTarget).attr("action").match(/\/occasions\/(\w*)/)[1]
    deadEvent = occasionCollection.get(id);
    deadEvent.destroy()
    false
