describe("MapView", function() {
  beforeEach(function() {
    loadFixtures("map.html");
    this.mapProviderSpy = sinon.stub(App.MapProviders.Leaflet);
    this.view = new App.MapView(this.mapProviderSpy);
  });

  it("should use the #map element by default", function() {
    expect(this.view.el.id).toEqual("map");
  });
});
