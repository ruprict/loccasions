describe("EventsCollection", function() {
  beforeEach(function() {
    this.eventStub = sinon.stub(App, "Event");

    this.model = new (Backbone.Model.extend({
      idAttribute: "_id"  
    }))
    ({
      _id: 5,
      name: "Test Event"
    });
    this.eventCollection = new App.EventsCollection();
    this.eventCollection.add(this.model);
  });

  afterEach(function() {
    this.eventStub.restore(); 
  });

  it("should add a model", function() {
    expect(this.eventCollection.length).toEqual(1);
  });

  it("should find a model by id", function(){
    expect(this.eventCollection.get(5).id).toEqual(5);
  });
});
