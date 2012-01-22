describe("CreateOccasionView", function() {
  beforeEach(function() {
    loadFixtures("occasionForm.html");
    this.view = new App.CreateOccasionView();
    this.form = $(this.view.el).find("form")[0];
  });
  it("should provide a form", function() {
    expect($(this.view.el).find("form").length).toEqual(1);
  });
  
  describe("creating an occasion", function() {
    beforeEach(function() {
      window.occasionCollection = new Backbone.Collection();
      this.createStub = sinon.stub(window.occasionCollection, "create");
      $(this.form).find("#occasion_latitude").val(35.333);
      $(this.form).find("#occasion_longitude").val(-85.222)
      this.view.createOccasion();
    });
    
    it("should call create on the EventCollection", function() {
      expect(this.createStub).toHaveBeenCalled();
    });

  });
  describe("parsing form attributes", function() {
    it("should have the correct attribute values", function() {
      $(this.form).find("#occasion_latitude").val(35.333);
      $(this.form).find("#occasion_longitude").val(-85.222)
      var attributes = UTIL.parseFormAttributes($(this.form), "occasion").occasion;
      expect(attributes.latitude).toEqual('35.333');
      expect(attributes.longitude).toEqual('-85.222');
    });
  });
});

