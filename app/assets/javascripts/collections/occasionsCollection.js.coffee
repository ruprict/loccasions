App or= {}
App.OccasionsCollection = Backbone.Collection.extend
  model: App.Occasion
  url: ->
    "events/" + window.App.event_id + "/occasions"
