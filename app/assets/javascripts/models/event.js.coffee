__super = Backbone.Model.prototype

App.Event = Backbone.Model.extend
  url: ->
    if (this.collection)
      return __super.url.call(@)
    else
      if this.id? != undefined then "/events" else "/events/" + @id
  validate: (attrs)->
    if !attrs.name
      "must have a valid name."
    
