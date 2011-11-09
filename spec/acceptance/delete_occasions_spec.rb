require 'spec_helper'

feature "Delete Occasion", %q{
  As a registered user,
  I want to delete an occasion from an event
} do
  
  background do
    Capybara.current_driver = :selenium
    @occasion = Factory(:occasion)
    login_user @occasion.event.user
    visit event_path(@occasion.event)
  end
  
  after do
    Capybara.use_default_driver
  end

  scenario "Delete Occasion" do
    page.should have_content("Test Occasion")
    page.should have_selector("form[action='/events/#{@occasion.event.id}/occasions/#{@occasion.id}'] input[value='delete']")
    # auto confirm the dialog
    page.execute_script('window.confirm = function() {return true;}')
    click_button "X"
    page.should_not have_content("Test Occasion")
  end

end
