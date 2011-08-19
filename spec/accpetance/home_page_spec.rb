require 'spec_helper'

feature 'Home Page', %q{
  As an unregistered user
  I want to see the home/landing page
} do
  background do
    # Nothing to do here
  end

  scenario "Home page" do
    visit "/"
    page.should have_link('Sign In')
    page.should have_selector('title', :content => "Loccasions")
    page.should have_content('What is Loccasions?')
  end

end
