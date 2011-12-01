module HelperMethods
  def click_sign_in
    visit "/"
    click_link "Sign In"
  end
end

RSpec.configure do |config|
  config.include HelperMethods
end
