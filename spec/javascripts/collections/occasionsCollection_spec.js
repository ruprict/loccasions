describe("OccasionsCollection", function() {
  beforeEach(function() {
    this.occStub = sinon.stub(App, "Occasion");

    this.model = new (Backbone.Model.extend({
      idAttribute: "_id"  
    }))
    ({
      _id: 5,
      name: "Test Occasion"
    });
    this.occCollection = new App.OccasionsCollection();
    this.occCollection.add(this.model);
  });

  afterEach(function() {
    this.occStub.restore(); 
  });

  it("should add a model", function() {
    expect(this.occCollection.length).toEqual(1);
  });

  it("should find a model by id", function(){
    expect(this.occCollection.get(5).id).toEqual(5);
  });
});

