require 'spec_helper'

feature 'Select Event', %q{
  As a registered user
  I want to select an Event
} do  
  
  background do
    @user = Factory(:user)
    @event = Factory(:event, :user => @user )
    login_user @user
  end

  scenario "Select Event" do
    page.should have_selector("a", :text => @event.name)
    click_link @event.name
    page.should have_selector("li.selected", :text=> @event.name)
    page.should have_selector("input[name='event[name]']", :value => @event.name)
    page.should have_selector("input[name='event[description]']", :value => @event.description)
  end

end
feature 'Edit Event', %q{
  As a registered user
  I want to edit a selected Event
} do
  
  background do
    @user = Factory(:user)
    @event = Factory(:event, :user => @user )
    login_user @user
    click_link @event.name
  end

  scenario "Edit Event" do
    fill_in "Name", :with=> "Edited Event"
    click_button "Update Event"
    page.should have_selector("a", :text => "Edited Event")
  end
end

