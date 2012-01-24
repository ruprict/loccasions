App or= {}
App.CreateOccasionView = Backbone.View.extend(
  initialize: ->
    @template = $(".edit_occasion").clone().children("form").end()
    $(@el).append(@template)
    $(@el).find('div').show()
    @form = $(@el).find("form")
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
      $(this.el).trigger('map:occasionAdded', occasion)
)
    

