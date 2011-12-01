
require File.expand_path('spec/spec_helper')

describe EventsController do
  render_views
  describe "GET index" do
    it "should respond with json when specified" do
      @event = Factory(:event)
      sign_in(@event.user)
      get :index, :format => :json
      response.should be_success
      JSON.parse(response.body)[0]['name'].should == (@event.name)
    end
  end
end
