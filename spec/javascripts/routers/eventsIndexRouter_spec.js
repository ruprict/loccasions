describe("App.EventsIndexRouter", function() {
  describe("routes", function() {
    beforeEach(function() {
      this.router = new App.EventsIndexRouter();
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
      this.router = new App.EventsIndexRouter();
      this.mockView = new Backbone.View({});
      this.eventListViewSpy = sinon.stub(App, "EventListView").returns(this.mockView);
      this.mapViewSpy = sinon.stub(App, "MapView").returns(this.mockView);
      this.createViewSpy = sinon.stub(App, "CreateEventView").returns(this.mockView);
      this.router.index();
    });

    afterEach(function() {
      App.MapView.restore();
      App.EventListView.restore();
      App.CreateEventView.restore();
    });

    it("should create the EventListView", function() {
      expect(this.eventListViewSpy).toHaveBeenCalled();
    });

    it("should create the MapView", function() {
      expect(this.mapViewSpy).toHaveBeenCalled();
    });

    it("should create the CreateEventView", function() {
      expect(this.createViewSpy).toHaveBeenCalled();
    });
  });
});
