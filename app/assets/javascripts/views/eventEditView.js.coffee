App or= {}
App.EventEditView = Backbone.View.extend(
  el: "#edit_event"
  initialize: ->
    @form = $(this.el).find("form")
  events:
    "submit form" : "handleFormSubmit"

  handleFormSubmit: (e)->
    e.stopPropagation()
    evento = new App.Event(@extractEventAttributesFromForm().event)
    has_id = @form.attr("action").match(/\/events\/(\w*)/)
    if has_id
      evento.id = has_id[1]
      evento.save()
    else
      eventCollection.create(evento)
    false
  #MOVE THIS
  extractEventAttributesFromForm: ->
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
    
