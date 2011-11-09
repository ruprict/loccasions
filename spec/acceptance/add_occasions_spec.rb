require 'spec_helper'

feature 'Add Occasion', %q{
  As a registered user
  I want to add an Occasion to an Event
} do
  background do
    @user = Factory(:user)
    login_user @user
    @event = Factory(:event,:user => @user )
    visit event_path(@event)
  end
  scenario "Add Occasion" do
    page.should_not have_css("ul#occasions > li")
    fill_in "Latitude", :with => 35.22 
    fill_in "Longitude", :with => -85.22 
    fill_in "Note", :with => "This is my new occasion"
    fill_in "Occurred at", :with => '2011-11-03' 
    click_button "Add"
    page.should have_css("ul#occasions > li", :count => 1)
    page.should have_content("This is my new occasion")
  end
  
end
