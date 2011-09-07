class EventsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @events = current_user.events
  end
  
  def create
    event = current_user.events.build(params[:event])
    event.save
    redirect_to events_path
  end


end
