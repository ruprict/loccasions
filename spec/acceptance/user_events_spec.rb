require 'spec_helper'

feature 'User Events Page', %q{
  As a signed in user
  I want to see my events 
  on my events page
} do
  include RequestMacros
  background do
    @user = Factory(:user)
    @event = Factory(:event, :user => @user)
    login_user @user

  end
  scenario "User is signed in" do
    visit events_path(@user)
    page.should have_content(@user.name)
    page.should have_selector("ul li", :text => @event.name)
  end
end
