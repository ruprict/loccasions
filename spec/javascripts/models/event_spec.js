describe("Event model", function() {
  beforeEach(function() {
      this.event = new App.Event({
        name: "New Event",
        description: "My Jasmine Event"
      }); 
  });
  describe("when instantiated with attributes", function() {
    it("should have a name and description", function() {
      expect(this.event.get("name")).toEqual("New Event");
      expect(this.event.get("description")).toEqual("My Jasmine Event");
    });
  });
  describe("when saving", function() {
    it("should not save when name is empty", function() {
      var eventSpy = sinon.spy();
      this.event.bind("error", eventSpy);
      this.event.save({"name":""});
      expect(eventSpy.calledOnce).toBeTruthy();
      // Make sure it passes in the event
      expect(eventSpy.args[0][0].cid).toEqual(this.event.cid);
      expect(eventSpy.args[0][1]).toEqual("must have a valid name.");
      
    });
  });
  describe("url", function() {
    it("should have a value if model is not part of a collection", function() {
      expect(this.event.url()).toEqual("/events");
    });
    it ("should reflect the collection url if part of a collection", function() {
      var collection = {
        url: "/loccasions"
      };
      this.event.collection = collection;
      expect(this.event.url()).toEqual("/loccasions");
    });
  });
});
