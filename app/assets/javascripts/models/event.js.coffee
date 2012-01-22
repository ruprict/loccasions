__super = Backbone.Model.prototype

App.Event = Backbone.Model.extend
  idAttribute: "_id"
  url: ->
    if this.id? == undefined then "/events" else "/events/" + @id
      url << "
     then "/events" else "/events/" + @id
  validate: (attrs)->
    if !attrs.name
      "must have a valid name."
    
