__super = Backbone.Model.prototype

App.Occasion = Backbone.Model.extend
  idAttribute: "_id"
  url: ->
    url = '/events/' + App.event_id + '/occasions'
    if this.id?
      url +=  '/' + @id
    url
  validate: (attrs)->
    if !attrs.latitude
      "must have a valid latitude."
    else if !attrs.longitude
      "must have a valid longitude."
    
