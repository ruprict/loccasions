App or= {}

App.MapProviders or= {}

App.MapProviders.Leaflet  =
  # Create new map
  Map: (elementId) ->
    new L.Map(elementId)
  BaseMapLayer: ()->
    cloudmadeUrl = 'http://{s}.tile.cloudmade.com/640718c4d80b45d6a279dff45f8a6dae/997/256/{z}/{x}/{y}.png'
    cloudmadeAttribution = 'Map data &copy; 2011 OpenStreetMap contributors, Imagery &copy; 2011 CloudMade'
    new L.TileLayer(cloudmadeUrl, {maxZoom: 18, attribution: cloudmadeAttribution})
  Point: (lat, lng) ->
    new L.LatLng(lat, lng)
  addLayerToMap: (map, layer) ->
    map.addLayer(layer)
  setViewForMap: (map, point, zoomLevel) ->
    map.setView(point, zoomLevel)



  
