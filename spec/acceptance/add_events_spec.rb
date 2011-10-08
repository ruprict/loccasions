require 'spec_helper'

feature 'Add Events', %q{
  As a registered user
  I want to add Events
} do
  background do
    login_user Factory(:user)
  end
  scenario "Add Basic Event" do
    fill_in "Name", :with => "New Event"
    fill_in "Description", :with => "This is my new event"
    click_button "Create Event"
    page.current_path.should == events_path 
    page.should have_content("New Event")
    page.should have_content("This is my new event")
    page.should have_selector("ul > li")
  end
  
end
