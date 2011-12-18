describe("CreateEventView", function() {
  beforeEach(function() {
    loadFixtures("eventForm.html");
    this.view = new App.CreateEventView();
    this.form = $(this.view.el).find("form")[0];
  });
  it("should provide a form", function() {
    expect($(this.view.el).find("form").length).toEqual(1);
  });
  
  describe("creating an event", function() {
    beforeEach(function() {
      window.eventCollection = new Backbone.Collection();
      this.createStub = sinon.stub(window.eventCollection, "create");
      $(this.form).find("#event_name").val("Test Event");
      $(this.form).find("#event_description").val("Test Event Description");
      this.view.createEvent();
    });
    
    it("should call create on the EventCollection", function() {
      expect(this.createStub).toHaveBeenCalled();
    });

  });
  describe("parsing form attributes", function() {
    it("should have the correct attribute values", function() {
      $(this.form).find("#event_name").val("Test Event");
      $(this.form).find("#event_description").val("Test Event Description");
      var attributes = this.view.parseFormAttributes().event;
      expect(attributes.name).toEqual("Test Event");
      expect(attributes.description).toEqual("Test Event Description");
    });
  });
});
