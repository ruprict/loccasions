describe("MapView", function() {
  beforeEach(function() {
    loadFixtures("map.html");

    this.mapProviderSpy = sinon.stub(App.MapProviders.Leaflet);
    this.view = new App.MapView(this.mapProviderSpy);
  });

  this.afterEach(function() {
    App.MapProviders.Leaflet.Map.restore();
    App.MapProviders.Leaflet.BaseMapLayer.restore();
    App.MapProviders.Leaflet.Point.restore();
    App.MapProviders.Leaflet.addLayerToMap.restore();
    App.MapProviders.Leaflet.setViewForMap.restore();
    App.MapProviders.Leaflet.addOccasion.restore();
    App.MapProviders.Leaflet.addClickHandler.restore();
    App.MapProviders.Leaflet.addNewOccasionMarker.restore();
  });

  it("should use the #map element by default", function() {
    expect(this.view.el.id).toEqual("map");
  });

  describe("render", function() {
    beforeEach(function() {
      this.mock = this.mapProviderSpy
    });
    it("should add a click handler to the map", function() {
      this.view.render();
      expect(this.mapProviderSpy.addClickHandler).toHaveBeenCalled();
    });
  });

  describe("When a new Occasion is requested", function() {
    beforeEach(function() {
      var e = {
        latlng: {lat: 100.00, lng: 100.00}
      };
      this.view.newOccasion(e);
    });

    it("should have a form", function() {
      expect($("#new_occasion_form").length).toEqual(1); 
    });

    it("should add a marker to the map", function () {
      expect(this.mapProviderSpy.addNewOccasionMarker).toHaveBeenCalled();
    });
  });
});
