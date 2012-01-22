describe("App.EventRouter", function() {
  describe("routes", function() {
    beforeEach(function() {
      this.router = new App.EventRouter();
      this.routeSpy = sinon.spy();
      try {
        Backbone.history.start({silent: true});
      } catch(e) {
        console.dir(e);
      }
      this.router.navigate("away");
    });
    it("should map the blank route to index", function() {
      this.router.bind("route:index", this.routeSpy);
      this.router.navigate("", true);
      expect(this.routeSpy).toHaveBeenCalledOnce();
      expect(this.routeSpy).toHaveBeenCalledWith();
    });
  });
  describe("index", function() {
    beforeEach(function() {
      loadFixtures("map.html");
      this.router = new App.EventRouter();
      this.mockView = new Backbone.View({});
      this.listViewSpy = sinon.stub(App, "OccasionListView").returns(this.mockView);
      this.mapViewSpy = sinon.stub(App, "MapView").returns(this.mockView);
      this.createViewSpy = sinon.stub(App, "CreateOccasionView").returns(this.mockView);
      this.router.index();
    });

    afterEach(function() {
      App.MapView.restore();
      App.OccasionListView.restore();
      App.CreateOccasionView.restore();
    });

    it("should create the OccasionListView", function() {
      expect(this.listViewSpy).toHaveBeenCalled();
    });

    it("should create the MapView", function() {
      expect(this.mapViewSpy).toHaveBeenCalled();
    });

    it("should create the CreateOccasionView", function() {
      expect(this.createViewSpy).toHaveBeenCalled();
    });
  });
});

