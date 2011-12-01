require 'spec_helper'

feature 'Show Event', %q{
  As a registered user
  I want to see an Event
  so I can see my Event Details
} do

  background do
    @user = Factory(:user)
    @event = Factory(:event, :user => @user )
    login_user @user
  end

  scenario "Show Event" do
    click_link "Show Details"
    page.current_path.should == event_path(@event)
    page.should have_content(@event.name)
    page.should have_content(@event.description)
  end
end
