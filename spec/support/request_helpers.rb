module RequestHelpers
  module Helpers
   def login_user(user)
      visit new_user_session_path 
      fill_in "Email", :with => "testy@test.com"
      fill_in "Password", :with => "password"
      click_button "Sign in"
    end
    def click_sign_in
      visit "/"
      click_link "Sign In"
    end
  end
end

RSpec.configure do |config|
  config.include RequestHelpers::Helpers, :type => :acceptance, :example_group => {
    :file_path => config.escaped_path(%w[spec acceptance])
  }
end

