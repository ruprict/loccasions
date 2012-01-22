describe("MapView", function() {
  beforeEach(function() {
    loadFixtures("map.html");
    this.mapProviderSpy = sinon.stub(App.MapProviders.Leaflet);
    this.view = new App.MapView(this.mapProviderSpy);
  });

  it("should use the #map element by default", function() {
    expect(this.view.el.id).toEqual("map");
  });

  describe("When the new Occasion form is presented to the user", function() {
    beforeEach(function() {
      this.view.showOccasionForm(); 
    });

    it("should have a form", function() {
      expect($("#new_occasion_form").length).toEqual(1); 
    });
  });
});
