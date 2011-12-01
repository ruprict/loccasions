describe("MapView", function() {
  it("should use the #map element by default", function() {
    loadFixtures("map.html");
    var mapProviderSpy = sinon.stub(App.MapProviders.Leaflet);
    var view = new App.MapView(mapProviderSpy);
    expect(view.el.id).toEqual("map");
  });
});
