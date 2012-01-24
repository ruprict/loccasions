__super = Backbone.Model.prototype

App.Event = Backbone.Model.extend
  idAttribute: "_id"
  url: ->
    url = ""
    if @collection?
      url += @collection.url
    else
      url += "/events"

    if @id?
      url += "/#{@id}"
    url
  validate: (attrs)->
    if !attrs.name
      "must have a valid name."
    
