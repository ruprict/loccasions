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
    evento = new App.Event(@parseFormAttributes().event)
    has_id = @form.attr("action").match(/\/events\/(\w*)/)
    if has_id
      evento.id = has_id[1]
      evento.save()
    else
      eventCollection.create(evento)
  parseFormAttributes: ->
    _.inject(
      @form.serializeArray(), 
      (memo, pair) ->
        key = pair.name
        return memo unless /^event/.test(key)
        val = pair.value
        if key.indexOf('[') > 0
          parentKey = key.substr(0, key.indexOf('['))
          childKey = key.split('[')[1].split(']')[0]
          if typeof memo[parentKey] == "undefined"
            memo[parentKey] = {}
          
          memo[parentKey][childKey] = val
        else
          memo[key] = val
        
        return memo
    ,{})
)
    
