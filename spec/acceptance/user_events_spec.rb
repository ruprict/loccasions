require 'spec_helper'

feature 'Signed In User Events Page', %q{
  As a signed in user
  I want to see my events 
  on my events page
} do
  background do
    @user = Factory(:user)
    @event = Factory(:event, :user => @user)
    login_user(@user)
  end
  scenario "User is signed in" do
    visit events_path
    page.should have_content(@user.name)
    page.should have_content(@event.name)
  end
end
feature 'Unauthorized User Events Page', %q{
  As a user that is not authorized in
  I should not be able to
  go to the user events page
} do
  background do
    @user = Factory.build(:user)
  end
  scenario "User is not signed in" do
    visit events_path
    current_path.should == new_user_session_path
  end
end
