App or= {}
App.EventsCollection = Backbone.Collection.extend
  model: App.Event
  url: 'events/'
