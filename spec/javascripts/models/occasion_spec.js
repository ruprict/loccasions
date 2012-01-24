describe("Occasion model", function() {
  beforeEach(function() {
      this.ev = new App.Event({_id: 222});
      App.event_id = this.ev.id;
      this.occ = new App.Occasion({
        latitude: 35.33,
        longitude: -88.44,
        note: "Test",
        _id: 11,
        event: this.ev
      }); 
  });
  describe("when instantiated with attributes", function() {
    it("should have a name and description", function() {
      expect(this.occ.get("latitude")).toEqual(35.33);
      expect(this.occ.get("note")).toEqual("Test");
    });
  });
  describe("when saving", function() {
    it("should not save when latitude is empty", function() {
      var occSpy = sinon.spy();
      this.occ.bind("error",occSpy );
      this.occ.save({"latitude":null});
      expect(occSpy.calledOnce).toBeTruthy();
      // Make sure it passes in the occasion
      expect(occSpy.args[0][0].cid).toEqual(this.occ.cid);
      expect(occSpy.args[0][1]).toEqual("must have a valid latitude.");
      
    });
  });
  describe("url", function() {
    it("should have the event in it ", function() {
      expect(this.occ.url()).toEqual("/events/222/occasions/11");
    });
  });
  describe("id", function() {
    it("should use _id for the id attribute", function() {
      var ev = new App.Occasion({_id:44});
      expect(ev.id).toEqual(44);
    });
  });
});

