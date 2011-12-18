describe("App.Router", function() {
  describe("routes", function() {
    beforeEach(function() {
      this.router = new App.Router();
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
      this.router = new App.Router();
      this.eventListView = new Backbone.View({});
      this.eventListViewSpy = sinon.stub(App, "EventListView").returns(this.eventListView);
      this.mapViewSpy = sinon.stub(App, "MapView").returns(this.eventListView);
      this.router.index();
    });

    afterEach(function() {
      App.MapView.restore();
      App.EventListView.restore();
    });

    it("should create the EventListView", function() {
      expect(this.eventListViewSpy).toHaveBeenCalled();
    });

    it("should create the MapView", function() {
      expect(this.mapViewSpy).toHaveBeenCalled();
    });
  });
});
