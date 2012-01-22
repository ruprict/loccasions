App or= {}
App.CreateOccasionView = Backbone.View.extend(
  el: "#edit_occasion"
  initialize: ->
    @form = $(this.el).find("form")
  events:
    "submit form" : "handleFormSubmission"
  handleFormSubmission: (e) ->
    e.stopPropagation()
    @createOccasion()
    false
  createOccasion: ()->
    occasion = new App.Occasion(UTIL.parseFormAttributes(@form, "occasion").occasion)
    has_id = @form.attr("action").match(/\/occasions\/(\w*)/)
    if has_id
      occasion.id = has_id[1]
      occasion.save()
    else
      occasionCollection.create(occasion)
)
    

