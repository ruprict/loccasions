describe("EventsListView", function() {
  
  it("should bind to the collection add event", function() {
    var coll = new Backbone.Collection({});
    var mockCollection = sinon.mock(coll);
    mockCollection.expects("bind").twice(); 
    var view = new App.EventListView({collection: coll});
    mockCollection.verify();
  });

  it("should have a UL as a dom element", function() {
    loadFixtures("eventList.html")
    var coll = { bind: function(){}}
    var view = new App.EventListView({collection: coll});
    expect(view.el.nodeName).toEqual("UL");

  });
  describe("Rendering events", function() {
    beforeEach(function() {
      loadFixtures("eventList.html")
      this.eventView = new Backbone.View();
      this.eventViewStub = sinon.stub(App, "EventView")
        .returns(this.eventView);
      this.event1 = new Backbone.Model({id:1});
      this.event2 = new Backbone.Model({id:2});
      this.event3 = new Backbone.Model({id:3});
      this.view = new App.EventListView({collection: 
        new Backbone.Collection([
          this.event1,
          this.event2,
          this.event3
        ])
      });
    });
    it("should add a list item for each event", function() {
      //Arrange
      // happening in beforeEach
      //Act
      this.view.render();
      //Assert
      expect(this.eventView.render).toHaveBeenCalledThrice();
      expect($("ul#event_list li").length).toEqual(3); 
    });
  });
});
