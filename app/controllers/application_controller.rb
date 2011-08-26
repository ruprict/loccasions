class ApplicationController < ActionController::Base
  protect_from_forgery

  # WE want the user to go to the events path on
  # successful sign in 
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || events_path
  end
end
