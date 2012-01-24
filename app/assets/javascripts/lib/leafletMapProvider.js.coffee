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
  addOccasion: (map,occ) ->
    if not @layerGroup?
      @layerGroup = new L.LayerGroup()
      map.addLayer(@layerGroup)
    ll = new L.LatLng(
      parseFloat(occ.get("latitude")),
      parseFloat(occ.get("longitude"))
    )
    marker = new L.Marker(ll)
    marker.bindPopup(occ.get("note"))
    @layerGroup.addLayer(marker)
  addNewOccasionMarker: (map, e, content) ->
    ll = new L.LatLng(e.latlng.lat,e.latlng.lng)
    @marker = new L.Marker(ll)
    @marker.bindPopup(content)
    map.addLayer(@marker)
    @marker.openPopup()
    $("#occasion_latitude").val(e.latlng.lat)
    $("#occasion_longitude").val(e.latlng.lng)
    $("#occasion_occurred_at").val(new Date())
  addClickHandler: (map, callback) ->
    map.on('click', callback)
  hidePopup: (map)->
    map.closePopup()
    map.removeLayer(@marker)
  removeAllMarkers: (map) ->
    if @layerGroup?
      @layerGroup.clearLayers()

    



  
